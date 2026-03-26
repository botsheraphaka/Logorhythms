-- =============================================
-- BOCRA HACKATHON DATABASE - CLEAN RE-CREATE
-- This will DROP the old database and build everything fresh
-- =============================================

USE master;
GO

-- Drop database if it exists
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'bocra_hackathon')
BEGIN
    ALTER DATABASE bocra_hackathon SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE bocra_hackathon;
    PRINT 'Old database dropped successfully.';
END
GO

-- Create fresh database
CREATE DATABASE bocra_hackathon;
GO

USE bocra_hackathon;
GO

-- =============================================
-- 1. USERS
-- =============================================
CREATE TABLE users (
    user_id          INT IDENTITY(1,1) PRIMARY KEY,
    full_name        NVARCHAR(150) NOT NULL,
    email            NVARCHAR(150) UNIQUE NOT NULL,
    phone            NVARCHAR(20),
    password_hash    NVARCHAR(255) NOT NULL,
    role             NVARCHAR(20) NOT NULL DEFAULT 'applicant',
    is_company       BIT DEFAULT 0,
    company_name     NVARCHAR(200),
    created_at       DATETIME2 DEFAULT GETDATE(),
    updated_at       DATETIME2 DEFAULT GETDATE()
);
GO

ALTER TABLE users ADD CONSTRAINT chk_users_role CHECK (role IN ('applicant', 'company_rep', 'admin'));
GO

-- =============================================
-- 2. LICENSE TYPES
-- =============================================
CREATE TABLE license_types (
    type_id          INT IDENTITY(1,1) PRIMARY KEY,
    category         NVARCHAR(20) NOT NULL,
    type_name        NVARCHAR(150) NOT NULL,
    description      NVARCHAR(MAX),
    typical_duration_years INT DEFAULT 15,
    created_at       DATETIME2 DEFAULT GETDATE()
);
GO

ALTER TABLE license_types ADD CONSTRAINT chk_license_category CHECK (category IN ('NFP', 'SAP', 'CSP', 'Postal'));
GO

-- =============================================
-- 3. LICENSING TABLES
-- =============================================
CREATE TABLE license_applications (
    application_id   INT IDENTITY(1,1) PRIMARY KEY,
    user_id          INT NOT NULL,
    license_type_id  INT NOT NULL,
    status           NVARCHAR(30) NOT NULL DEFAULT 'Pending',
    application_date DATE NOT NULL,
    submitted_documents NVARCHAR(MAX),
    notes            NVARCHAR(MAX),
    created_at       DATETIME2 DEFAULT GETDATE(),
    updated_at       DATETIME2 DEFAULT GETDATE()
);
GO
ALTER TABLE license_applications ADD CONSTRAINT chk_application_status CHECK (status IN ('Pending', 'Under_Review', 'Approved', 'Rejected', 'Expired', 'Suspended'));
GO

CREATE TABLE licenses (
    license_id       INT IDENTITY(1,1) PRIMARY KEY,
    application_id   INT NULL,
    user_id          INT NOT NULL,
    license_number   NVARCHAR(50) UNIQUE NOT NULL,
    license_type_id  INT NOT NULL,
    issue_date       DATE NOT NULL,
    expiry_date      DATE NOT NULL,
    status           NVARCHAR(20) NOT NULL DEFAULT 'Active',
    created_at       DATETIME2 DEFAULT GETDATE(),
    updated_at       DATETIME2 DEFAULT GETDATE()
);
GO
ALTER TABLE licenses ADD CONSTRAINT chk_license_status CHECK (status IN ('Active', 'Expired', 'Suspended', 'Revoked'));
GO

-- Foreign Keys
ALTER TABLE license_applications ADD CONSTRAINT fk_la_user FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE;
ALTER TABLE license_applications ADD CONSTRAINT fk_la_type FOREIGN KEY (license_type_id) REFERENCES license_types(type_id);
ALTER TABLE licenses ADD CONSTRAINT fk_licenses_user FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE;
ALTER TABLE licenses ADD CONSTRAINT fk_licenses_application FOREIGN KEY (application_id) REFERENCES license_applications(application_id) ON DELETE SET NULL;
ALTER TABLE licenses ADD CONSTRAINT fk_licenses_type FOREIGN KEY (license_type_id) REFERENCES license_types(type_id);
GO

-- =============================================
-- 4. EQUIPMENT APPROVALS
-- =============================================
CREATE TABLE equipment_approvals (
    approval_id      INT IDENTITY(1,1) PRIMARY KEY,
    ta_number        NVARCHAR(50) UNIQUE NOT NULL,
    applicant_name   NVARCHAR(200) NOT NULL,
    manufacturer     NVARCHAR(150) NOT NULL,
    model            NVARCHAR(100) NOT NULL,
    description      NVARCHAR(MAX),
    expiry_date      DATE NULL,
    status           NVARCHAR(20) NOT NULL DEFAULT 'Approved',
    user_id          INT NULL,
    created_at       DATETIME2 DEFAULT GETDATE(),
    updated_at       DATETIME2 DEFAULT GETDATE()
);
GO
ALTER TABLE equipment_approvals ADD CONSTRAINT chk_equipment_status CHECK (status IN ('Approved', 'Pending', 'Rejected', 'Expired'));
GO

CREATE NONCLUSTERED INDEX idx_ta_number ON equipment_approvals(ta_number);
CREATE NONCLUSTERED INDEX idx_manufacturer_model ON equipment_approvals(manufacturer, model);
GO

ALTER TABLE equipment_approvals ADD CONSTRAINT fk_ea_user FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE SET NULL;
GO

-- =============================================
-- 5. COMPLAINTS
-- =============================================
CREATE TABLE complaints (
    complaint_id     INT IDENTITY(1,1) PRIMARY KEY,
    user_id          INT NOT NULL,
    service_provider NVARCHAR(150) NOT NULL,
    complaint_type   NVARCHAR(50) NOT NULL,
    description      NVARCHAR(MAX) NOT NULL,
    status           NVARCHAR(30) NOT NULL DEFAULT 'Pending',
    submission_date  DATE NOT NULL,
    resolution_date  DATE NULL,
    resolution_notes NVARCHAR(MAX),
    created_at       DATETIME2 DEFAULT GETDATE(),
    updated_at       DATETIME2 DEFAULT GETDATE()
);
GO
ALTER TABLE complaints ADD CONSTRAINT chk_complaint_status CHECK (status IN ('Pending', 'Under_Investigation', 'Resolved', 'Closed', 'Rejected'));
GO
ALTER TABLE complaints ADD CONSTRAINT chk_complaint_type CHECK (complaint_type IN ('Billing','Service_Failure_Repair','Interconnection','Repair_Delay','Fault_Repair','Mobile_Phone_Issue','Internet_Access_Contract','Other'));
GO

ALTER TABLE complaints ADD CONSTRAINT fk_complaints_user FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE;
GO

CREATE NONCLUSTERED INDEX idx_complaint_status ON complaints(status);
CREATE NONCLUSTERED INDEX idx_service_provider ON complaints(service_provider);
GO

-- =============================================
-- Optional: DOCUMENTS
-- =============================================
CREATE TABLE documents (
    doc_id           INT IDENTITY(1,1) PRIMARY KEY,
    title            NVARCHAR(200) NOT NULL,
    category         NVARCHAR(50) NOT NULL,
    file_path        NVARCHAR(255) NOT NULL,
    upload_date      DATE NOT NULL,
    created_at       DATETIME2 DEFAULT GETDATE()
);
GO
ALTER TABLE documents ADD CONSTRAINT chk_doc_category CHECK (category IN ('Legislation', 'Guideline', 'Report', 'Application_Form'));
GO

-- =============================================
-- SEED DATA (realistic BOCRA samples)
-- =============================================
INSERT INTO users (full_name, email, phone, role, is_company, company_name, password_hash)
VALUES 
('John Doe', 'john@btc.bw', '+267 71234567', 'company_rep', 1, 'Botswana Telecommunications Corporation', 'hashedpassword1'),
('Jane Smith', 'jane@gmail.com', '+267 72345678', 'applicant', 0, NULL, 'hashedpassword2');

INSERT INTO license_types (category, type_name, description, typical_duration_years)
VALUES 
('NFP', 'National Network Facilities', 'Public Land Mobile Cellular Systems, Fixed Systems, etc.', 15),
('SAP', 'Cellular Services and Applications', 'Voice/Data/Text on cellular networks', 15);

INSERT INTO license_applications (user_id, license_type_id, status, application_date, submitted_documents, notes)
VALUES 
(1, 1, 'Approved', '2025-06-15', '{"id_copy":"doc1.pdf", "business_reg":"doc2.pdf"}', 'BTC national network renewal');

INSERT INTO licenses (application_id, user_id, license_number, license_type_id, issue_date, expiry_date, status)
VALUES 
(1, 1, 'BOCRA/NFP/2026/001', 1, '2026-01-01', '2041-01-01', 'Active');

INSERT INTO equipment_approvals (ta_number, applicant_name, manufacturer, model, description, expiry_date, status)
VALUES 
('BOCRA/TA/2016/2741', 'ZTE Botswana (Pty) Ltd', 'ZTE', 'V7 LITE', 'Computer', '2017-07-31', 'Approved'),
('BOCRA/TA/2013/413', 'ZTE Botswana (Pty) Ltd', 'ZTE', 'ZXHN H108N', 'Advanced ADSL2+ Gateway Modem', '2014-04-30', 'Approved');

INSERT INTO complaints (user_id, service_provider, complaint_type, description, status, submission_date)
VALUES 
(2, 'BTC', 'Billing', 'Overcharged for data bundle I never used.', 'Under_Investigation', '2026-03-10');

PRINT '✅ BOCRA Hackathon Database created successfully with seed data!';
GO