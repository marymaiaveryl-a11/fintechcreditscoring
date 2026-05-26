CREATE TABLE DATA_PARTNER (
    PartnerID      CHAR(10)        NOT NULL PRIMARY KEY,
    PartnerName    NVARCHAR(50)    NOT NULL,
    PartnerType    CHAR(30)        NOT NULL,
    Address        NVARCHAR(100)   NULL,
    Email          VARCHAR(50)     NOT NULL,
    Phone          VARCHAR(15)     NOT NULL,
    RegisterDate   DATE            NOT NULL,
    Status         CHAR(20)        NOT NULL
);
CREATE TABLE FINTECH_APP (
    AppID        CHAR(10)       NOT NULL PRIMARY KEY,   
    PartnerID    CHAR(10)       NOT NULL,
    AppName      NVARCHAR(50)   NOT NULL,
    AppType      CHAR(30)       NOT NULL,
    APIEndpoint  VARCHAR(100)   NOT NULL,
    ActiveStatus CHAR(20)       NOT NULL,
    CreatedDate  DATETIME       NOT NULL
);
CREATE TABLE DATA_SHARING_AGREEMENT (
    AgreementID     CHAR(10)      NOT NULL PRIMARY KEY, 
    PartnerID       CHAR(10)      NOT NULL,
    ConsentType     CHAR(20)      NOT NULL,
    RenewalStatus   CHAR(20)      NULL,
    AgreementDate   DATE          NOT NULL,
    ExpiryDate      DATE          NULL,
    AgreementStatus CHAR(20)      NOT NULL,
    AccessScope     NVARCHAR(100) NOT NULL,
    SecurityLevel   CHAR(20)      NOT NULL
);
CREATE TABLE RAW_DATA_SOURCE (
    SourceID       CHAR(10)       NOT NULL PRIMARY KEY,  
    PartnerID      CHAR(10)       NOT NULL,
    AppID          CHAR(10)       NOT NULL,
    AgreementID    CHAR(10)       NOT NULL,
    SourceName     NVARCHAR(50)   NOT NULL,
    SourceType     CHAR(30)       NOT NULL,
    Description    NVARCHAR(100)  NULL,
    CreatedDate    DATE           NOT NULL
);
CREATE TABLE EVENT (
    EventID          CHAR(10)       NOT NULL PRIMARY KEY, 
    PartnerID        CHAR(10)       NOT NULL,
    AppID            CHAR(10)       NOT NULL,
    AgreementID      CHAR(10)       NOT NULL,
    SourceID         CHAR(10)       NOT NULL,
    UserID           CHAR(10)       NOT NULL,
    WarehouseID      CHAR(10)       NULL,
    EventType        CHAR(30)       NOT NULL,
    EventDescription NVARCHAR(100)  NULL,
    EventValue       DECIMAL(18,2)  NULL,
    EventDate        DATETIME       NOT NULL,
    EventStatus      CHAR(20)       NOT NULL,
    RawDataSize      INT            NULL,
    ProcessingTime   INT            NULL
);
CREATE TABLE DATA_WAREHOUSE (
    WarehouseID       CHAR(10)       NOT NULL PRIMARY KEY,  
    WarehouseName     NVARCHAR(50)   NOT NULL,
    WarehouseType     CHAR(30)       NOT NULL,
    OwnerDepartment   NVARCHAR(50)   NULL,
    StoragePath       VARCHAR(100)   NOT NULL,
    Capacity          DECIMAL(10,2)  NULL,
    LastUpdated       DATETIME       NOT NULL,
    IntegrationStatus CHAR(20)       NULL,
    Status            CHAR(20)       NOT NULL
);
CREATE TABLE MODEL (
    ModelID       CHAR(10)       NOT NULL PRIMARY KEY,  
    WarehouseID   CHAR(10)       NOT NULL,
    ModelName     NVARCHAR(50)   NOT NULL,
    Version       VARCHAR(10)    NULL,
    Description   NVARCHAR(100)  NULL,
    AlgorithmType CHAR(30)       NOT NULL,
    CreatedDate   DATE           NOT NULL,
    Status        CHAR(20)       NULL
);
CREATE TABLE CALCULATION (
    CalcID           CHAR(10)       NOT NULL PRIMARY KEY,  
    ProfileID        CHAR(10)       NOT NULL,
    ModelID          CHAR(10)       NOT NULL,
    CalculationDate  DATE           NOT NULL,
    InputDataVolume  INT            NULL,
    OutputScore      DECIMAL(10,2)  NULL,
    Notes            NVARCHAR(100)  NULL
);
CREATE TABLE PERFORMANCE (
    PerformanceID     CHAR(10)       NOT NULL PRIMARY KEY,  
    ModelID           CHAR(10)       NOT NULL,
    CalcID            CHAR(10)       NULL,
    EvaluationDate    DATE           NOT NULL,
    Accuracy          DECIMAL(5,2)   NOT NULL,
    StabilityIndex    DECIMAL(5,2)   NULL,
    DataDriftScore    DECIMAL(5,2)   NULL,
    Precision         DECIMAL(5,2)   NULL,
    Recall            DECIMAL(5,2)   NULL,
    Notes             NVARCHAR(100)  NULL
);
CREATE TABLE USER_PROFILE (
    UserID          CHAR(10)       NOT NULL PRIMARY KEY,  
    FullName        NVARCHAR(50)   NOT NULL,
    DateOfBirth     DATE           NULL,
    Gender          CHAR(10)       NULL,
    Email           VARCHAR(50)    NOT NULL,
    Phone           VARCHAR(15)    NOT NULL,
    Address         NVARCHAR(100)  NULL,
    RegisterDate    DATE           NOT NULL,
    ConsentStatus   CHAR(10)       NOT NULL,
    ConsentDate     DATE           NULL,
    AccountStatus   CHAR(20)       NOT NULL,
    Username        VARCHAR(30)    NOT NULL,
    Password        VARCHAR(50)    NOT NULL,
    LastLogin       DATETIME       NULL
);
CREATE TABLE CREDIT_PROFILE (
    ProfileID        CHAR(10)       NOT NULL PRIMARY KEY, 
    WarehouseID      CHAR(10)       NOT NULL,
    UserID           CHAR(10)       NOT NULL,
    TotalTransactions INT           NOT NULL,
    TotalDebt        DECIMAL(18,2)  NOT NULL,
    AvgIncome        DECIMAL(18,2)  NULL,
    AvgSpending      DECIMAL(18,2)  NULL,
    RiskLevel        CHAR(10)       NULL,
    LastUpdated      DATETIME       NOT NULL,
    DataCoverage     DECIMAL(5,2)   NULL,
    ProfileStatus    CHAR(20)       NOT NULL,
    Version          VARCHAR(10)    NULL
);
CREATE TABLE CREDIT_SCORE (
    ScoreID         CHAR(10)       NOT NULL PRIMARY KEY, 
    ProfileID       CHAR(10)       NOT NULL,
    ModelID         CHAR(10)       NOT NULL,
    ScoreValue      INT            NOT NULL,
    ScoreConfidence DECIMAL(5,2)   NULL,
    RiskCategory    CHAR(20)       NOT NULL,
    LastCalculated  DATETIME       NOT NULL,
    Status          CHAR(20)       NULL
);
CREATE TABLE CREDIT_FACTOR (
    FactorID      CHAR(10)       NOT NULL PRIMARY KEY, 
    ScoreID       CHAR(10)       NOT NULL,
    FactorName    NVARCHAR(50)   NOT NULL,
    FactorWeight  DECIMAL(5,2)   NOT NULL,
    FactorValue   DECIMAL(18,2)  NULL,
    FactorImpact  CHAR(15)       NULL
);
CREATE TABLE B2B_CLIENT (
    ClientID          CHAR(10)       NOT NULL PRIMARY KEY,  
    ClientName        NVARCHAR(50)   NOT NULL,
    ClientType        CHAR(30)       NOT NULL,
    TaxCode           VARCHAR(15)    NULL,
    BusinessLicenseNo VARCHAR(20)    NULL,
    Address           NVARCHAR(100)  NULL,
    Email             VARCHAR(50)    NOT NULL,
    Phone             VARCHAR(15)    NOT NULL,
    RegisterDate      DATE           NOT NULL,
    Status            CHAR(20)       NOT NULL
);
CREATE TABLE SERVICE_AGREEMENT (
    AgreementID    CHAR(10)       NOT NULL PRIMARY KEY,  
    ClientID       CHAR(10)       NOT NULL,
    StartDate      DATE           NOT NULL,
    EndDate        DATE           NULL,
    ServiceLevel   CHAR(30)       NOT NULL,
    QueryLimit     INT            NULL,
    FeePerQuery    DECIMAL(10,2)  NOT NULL,
    ContractType   CHAR(30)       NULL,
    Status         CHAR(20)       NOT NULL
);
CREATE TABLE SCORE_QUERY (
    QueryID        CHAR(10)       NOT NULL PRIMARY KEY,  
    ScoreID        CHAR(10)       NOT NULL,
    AgreementID    CHAR(10)       NOT NULL,
    ProfileID      CHAR(10)       NOT NULL,
    QueryDate      DATETIME       NOT NULL,
    QueryResult    NVARCHAR(100)  NULL,
    QueryStatus    CHAR(20)       NULL,
    RiskCategory   CHAR(20)       NULL,
    Recommendation NVARCHAR(100)  NULL
);
CREATE TABLE INVOICE (
    InvoiceID      CHAR(10)       NOT NULL PRIMARY KEY,  
    AgreementID    CHAR(10)       NOT NULL,
    ClientID       CHAR(10)       NOT NULL,
    InvoiceDate    DATE           NOT NULL,
    TotalQueries   INT            NULL,
    TotalAmount    DECIMAL(18,2)  NOT NULL,
    PaymentMethod  CHAR(20)       NULL,
    DueDate        DATE           NULL,
    PaymentStatus  CHAR(20)       NOT NULL
);
ALTER TABLE FINTECH_APP
ADD CONSTRAINT FK_FINTECHAPP_PARTNER
FOREIGN KEY (PartnerID) REFERENCES DATA_PARTNER(PartnerID);

ALTER TABLE DATA_SHARING_AGREEMENT
ADD CONSTRAINT FK_AGREEMENT_PARTNER
FOREIGN KEY (PartnerID) REFERENCES DATA_PARTNER(PartnerID);


ALTER TABLE EVENT
ADD CONSTRAINT FK_EVENT_PARTNER
FOREIGN KEY (PartnerID) REFERENCES DATA_PARTNER(PartnerID);

ALTER TABLE EVENT
ADD CONSTRAINT FK_EVENT_APP
FOREIGN KEY (AppID) REFERENCES FINTECH_APP(AppID);

ALTER TABLE EVENT
ADD CONSTRAINT FK_EVENT_AGREEMENT
FOREIGN KEY (AgreementID) REFERENCES DATA_SHARING_AGREEMENT(AgreementID);

ALTER TABLE EVENT
ADD CONSTRAINT FK_EVENT_SOURCE
FOREIGN KEY (SourceID) REFERENCES RAW_DATA_SOURCE(SourceID);

ALTER TABLE EVENT
ADD CONSTRAINT FK_EVENT_USER
FOREIGN KEY (UserID) REFERENCES USER_PROFILE(UserID);

ALTER TABLE EVENT
ADD CONSTRAINT FK_EVENT_WAREHOUSE
FOREIGN KEY (WarehouseID) REFERENCES DATA_WAREHOUSE(WarehouseID);

ALTER TABLE CREDIT_PROFILE
ADD CONSTRAINT FK_CREDIT_PROFILE_WAREHOUSE
FOREIGN KEY (WarehouseID) REFERENCES DATA_WAREHOUSE(WarehouseID);

ALTER TABLE CREDIT_PROFILE
ADD CONSTRAINT FK_CREDIT_PROFILE_USER
FOREIGN KEY (UserID) REFERENCES USER_PROFILE(UserID);

ALTER TABLE MODEL
ADD CONSTRAINT FK_MODEL_WAREHOUSE
FOREIGN KEY (WarehouseID) REFERENCES DATA_WAREHOUSE(WarehouseID);

ALTER TABLE CALCULATION
ADD CONSTRAINT FK_CALCULATION_MODEL
FOREIGN KEY (ModelID) REFERENCES MODEL(ModelID);

ALTER TABLE CALCULATION
ADD CONSTRAINT FK_CALCULATION_PROFILE
FOREIGN KEY (ProfileID) REFERENCES CREDIT_PROFILE(ProfileID);

ALTER TABLE CREDIT_PROFILE
ADD CONSTRAINT FK_CP_WAREHOUSE
FOREIGN KEY (WarehouseID) REFERENCES DATA_WAREHOUSE(WarehouseID);

ALTER TABLE CREDIT_PROFILE
ADD CONSTRAINT FK_CP_USER
FOREIGN KEY (UserID) REFERENCES USER_PROFILE(UserID);

ALTER TABLE CREDIT_SCORE
ADD CONSTRAINT FK_CREDIT_SCORE_PROFILE
FOREIGN KEY (ProfileID) REFERENCES CREDIT_PROFILE(ProfileID);

ALTER TABLE CREDIT_SCORE
ADD CONSTRAINT FK_CREDIT_SCORE_MODEL
FOREIGN KEY (ModelID) REFERENCES MODEL(ModelID);

ALTER TABLE CREDIT_FACTOR
ADD CONSTRAINT FK_CREDIT_FACTOR_SCORE
FOREIGN KEY (ScoreID) REFERENCES CREDIT_SCORE(ScoreID);

ALTER TABLE PERFORMANCE
ADD CONSTRAINT FK_PERFORMANCE_MODEL
FOREIGN KEY (ModelID) REFERENCES MODEL(ModelID);

ALTER TABLE PERFORMANCE
ADD CONSTRAINT FK_PERFORMANCE_CALC
FOREIGN KEY (CalcID) REFERENCES CALCULATION(CalcID);

ALTER TABLE SERVICE_AGREEMENT
ADD CONSTRAINT FK_SERVICE_AGREEMENT_CLIENT
FOREIGN KEY (ClientID) REFERENCES B2B_CLIENT(ClientID);

ALTER TABLE SCORE_QUERY
ADD CONSTRAINT FK_SCORE_QUERY_SCORE
FOREIGN KEY (ScoreID) REFERENCES CREDIT_SCORE(ScoreID);

ALTER TABLE SCORE_QUERY
ADD CONSTRAINT FK_SCORE_QUERY_AGREEMENT
FOREIGN KEY (AgreementID) REFERENCES SERVICE_AGREEMENT(AgreementID);

ALTER TABLE SCORE_QUERY
ADD CONSTRAINT FK_SCORE_QUERY_PROFILE
FOREIGN KEY (ProfileID) REFERENCES CREDIT_PROFILE(ProfileID);

ALTER TABLE INVOICE
ADD CONSTRAINT FK_INVOICE_AGREEMENT
FOREIGN KEY (AgreementID) REFERENCES SERVICE_AGREEMENT(AgreementID);

ALTER TABLE INVOICE
ADD CONSTRAINT FK_INVOICE_CLIENT
FOREIGN KEY (ClientID) REFERENCES B2B_CLIENT(ClientID);

INSERT INTO DATA_PARTNER (
    PartnerID,
    PartnerName,
    PartnerType,
    Address,
    Email,
    Phone,
    RegisterDate,
    Status
)
VALUES
('P000000001', N'Công ty Tài Chính ABC', 'Financial', N'123 Nguyễn Trãi, Hà Nội', 'info@abcfinance.vn', '0912345678', '2021-05-12', 'Active'),

('P000000002', N'Ngân hàng XYZ', 'Bank', N'45 Lê Lợi, TP. Hồ Chí Minh', 'contact@xyzbank.com', '0909876543', '2019-11-20', 'Active'),

('P000000003', N'Công ty Bảo hiểm An Tâm', 'Insurance', N'67 Trần Hưng Đạo, Đà Nẵng', 'support@antam.vn', '0933557799', '2020-03-01', 'Inactive'),

('P000000004', N'Tập đoàn Công nghệ DigiTech', 'Technology', N'12 Pasteur, TP. Hồ Chí Minh', 'hello@digitech.vn', '0988112233', '2022-08-15', 'Active'),

('P000000005', N'Công ty Kiểm toán Toàn Cầu', 'Audit', NULL, 'global.audit@gmail.com', '0904455667', '2018-01-05', 'Active');

INSERT INTO FINTECH_APP (
    AppID,
    PartnerID,
    AppName,
    AppType,
    APIEndpoint,
    ActiveStatus,
    CreatedDate
)
VALUES
('A000000001', 'P000000001', N'ABC Finance Mobile', 'Financial', 'https://api.abcfinance.vn/v1', 'Active', '2021-06-01 09:15:00'),

('A000000002', 'P000000002', N'XYZ Banking App', 'Banking', 'https://service.xyzbank.com/api', 'Active', '2020-12-10 14:30:00'),

('A000000003', 'P000000003', N'An Tâm Insurance Portal', 'Insurance', 'https://api.antam.vn/portal', 'Inactive', '2022-03-20 08:00:00'),

('A000000004', 'P000000004', N'DigiTech Pay', 'E-Wallet', 'https://gateway.digitech.vn/pay', 'Active', '2022-09-12 11:45:00'),

('A000000005', 'P000000005', N'Global Audit Checker', 'Audit', 'https://api.globalaudit.vn/check', 'Active', '2019-07-02 10:10:00');

INSERT INTO DATA_SHARING_AGREEMENT (
    AgreementID,
    PartnerID,
    ConsentType,
    RenewalStatus,
    AgreementDate,
    ExpiryDate,
    AgreementStatus,
    AccessScope,
    SecurityLevel
)
VALUES
('AG0000001', 'P000000001', 'Full Consent', 'Auto-Renew', '2021-01-15', '2023-01-14', 'Active', N'Full Data Access', 'High'),

('AG0000002', 'P000000002', 'Limited Consent', 'Manual', '2020-06-20', '2022-06-19', 'Inactive', N'Transaction Data Only', 'Medium'),

('AG0000003', 'P000000003', 'Full Consent', NULL, '2021-09-10', NULL, 'Active', N'Customer Data & Reports', 'High'),

('AG0000004', 'P000000004', 'Limited Consent', 'Auto-Renew', '2022-02-05', '2024-02-04', 'Active', N'Payment Data Only', 'Medium'),

('AG0000005', 'P000000005', 'Full Consent', 'Manual', '2019-11-12', '2021-11-11', 'Inactive', N'Audit & Reporting', 'High');

INSERT INTO RAW_DATA_SOURCE (
    SourceID,
    PartnerID,
    AppID,
    AgreementID,
    SourceName,
    SourceType,
    Description,
    CreatedDate
)
VALUES
('S00000001', 'P000000001', 'A000000001', 'AG0000001', N'Customer Transactions', 'Financial', N'Dữ liệu giao dịch khách hàng của ABC Finance', '2021-06-01'),

('S00000002', 'P000000002', 'A000000002', 'AG0000002', N'Account Balances', 'Banking', N'Dữ liệu số dư tài khoản của khách hàng XYZ Bank', '2020-12-10'),

('S00000003', 'P000000003', 'A000000003', 'AG0000003', N'Insurance Claims', 'Insurance', N'Dữ liệu các yêu cầu bồi thường bảo hiểm', '2022-03-20'),

('S00000004', 'P000000004', 'A000000004', 'AG0000004', N'Payment History', 'E-Wallet', N'Lịch sử giao dịch ví điện tử DigiTech Pay', '2022-09-12'),

('S00000005', 'P000000005', 'A000000005', 'AG0000005', N'Audit Reports', 'Audit', N'Báo cáo kiểm toán toàn cầu', '2019-07-02');

INSERT INTO USER_PROFILE (
    UserID,
    FullName,
    DateOfBirth,
    Gender,
    Email,
    Phone,
    Address,
    RegisterDate,
    ConsentStatus,
    ConsentDate,
    AccountStatus,
    Username,
    Password,
    LastLogin
)
VALUES
('U00000001', N'Nguyễn Văn An', '1990-01-15', 'Male', 'nguyenvanan@example.com', '0912345678', N'123 Nguyễn Trãi, Hà Nội', '2020-05-10', 'Yes', '2020-05-11', 'Active', 'nguyenvanan', 'pass123', '2023-01-10 09:30:00'),

('U00000002', N'Trần Thị Bình', '1988-03-20', 'Female', 'tranthibinh@example.com', '0909876543', N'45 Lê Lợi, TP. Hồ Chí Minh', '2019-11-12', 'Yes', '2019-11-13', 'Active', 'tranthibinh', 'pass456', '2023-01-11 14:45:00'),

('U00000003', N'Lê Văn Cường', '1992-07-05', 'Male', 'levancuong@example.com', '0933557799', N'67 Trần Hưng Đạo, Đà Nẵng', '2021-03-15', 'No', NULL, 'Inactive', 'levancuong', 'pass789', '2023-01-12 08:15:00'),

('U00000004', N'Phạm Thị Dung', '1995-09-12', 'Female', 'phamthidung@example.com', '0988112233', N'12 Pasteur, TP. Hồ Chí Minh', '2022-08-20', 'Yes', '2022-08-21', 'Active', 'phamthidung', 'pass321', '2023-01-13 11:20:00'),

('U00000005', N'Võ Văn Hùng', '1985-11-30', 'Male', 'vovanhung@example.com', '0904455667', N'89 Hai Bà Trưng, Hà Nội', '2018-01-05', 'Yes', '2018-01-06', 'Inactive', 'vovanhung', 'pass654', '2023-01-14 10:10:00');

INSERT INTO DATA_WAREHOUSE (
    WarehouseID,
    WarehouseName,
    WarehouseType,
    OwnerDepartment,
    StoragePath,
    Capacity,
    LastUpdated,
    IntegrationStatus,
    Status
)
VALUES
('W00000001', N'Kho Dữ liệu Hà Nội', 'Financial', N'Phòng CNTT', 'C:\Data\Hanoi', 5000.00, '2023-01-10 09:30:00', 'Integrated', 'Active'),

('W00000002', N'Kho Dữ liệu TP.HCM', 'Banking', N'Phòng Dữ liệu', 'D:\Data\HCM', 7500.00, '2023-01-11 14:45:00', 'Pending', 'Active'),

('W00000003', N'Kho Dữ liệu Đà Nẵng', 'Insurance', N'Phòng Kiểm toán', 'E:\Data\Danang', 3000.00, '2023-01-12 08:15:00', 'Integrated', 'Active'),

('W00000004', N'Kho Dữ liệu DigiTech', 'E-Wallet', N'Phòng Thanh toán', 'F:\Data\DigiTech', 4000.00, '2023-01-13 11:20:00', 'Pending', 'Inactive'),

('W00000005', N'Kho Dữ liệu Kiểm toán', 'Audit', N'Phòng Kiểm soát', 'G:\Data\Audit', 6000.00, '2023-01-14 10:10:00', 'Integrated', 'Active');

INSERT INTO EVENT (
    EventID,
    PartnerID,
    AppID,
    AgreementID,
    SourceID,
    UserID,
    WarehouseID,
    EventType,
    EventDescription,
    EventValue,
    EventDate,
    EventStatus,
    RawDataSize,
    ProcessingTime
)
VALUES
('E00000001', 'P000000001', 'A000000001', 'AG0000001', 'S00000001', 'U00000001', 'W00000001', 'Transaction', N'Giao dịch khách hàng Hà Nội', 1500.75, '2023-01-10 09:30:00', 'Completed', 1024, 120),

('E00000002', 'P000000002', 'A000000002', 'AG0000002', 'S00000002', 'U00000002', 'W00000002', 'BalanceUpdate', N'Cập nhật số dư tài khoản TP.HCM', 0, '2023-01-11 14:45:00', 'Completed', 512, 90),

('E00000003', 'P000000003', 'A000000003', 'AG0000003', 'S00000003', 'U00000003', 'W00000003', 'ClaimProcessed', N'Xử lý yêu cầu bồi thường Đà Nẵng', 250.00, '2023-01-12 08:15:00', 'Pending', 2048, 200),

('E00000004', 'P000000004', 'A000000004', 'AG0000004', 'S00000004', 'U00000004', 'W00000004', 'Payment', N'Giao dịch ví điện tử DigiTech', 500.50, '2023-01-13 11:20:00', 'Completed', 1536, 150),

('E00000005', 'P000000005', 'A000000005', 'AG0000005', 'S00000005', 'U00000005', 'W00000005', 'AuditReport', N'Báo cáo kiểm toán toàn cầu', NULL, '2023-01-14 10:10:00', 'Completed', 3072, 300);

INSERT INTO MODEL (
    ModelID,
    WarehouseID,
    ModelName,
    Version,
    Description,
    AlgorithmType,
    CreatedDate,
    Status
)
VALUES
('M00000001', 'W00000001', N'Mô hình dự đoán tín dụng', 'v1.0', N'Dự đoán khả năng trả nợ khách hàng Hà Nội', 'Regression', '2023-01-10', 'Active'),
('M00000002', 'W00000002', N'Mô hình phân loại khách hàng', 'v1.2', N'Phân loại khách hàng theo mức độ rủi ro TP.HCM', 'Classification', '2023-01-11', 'Active'),
('M00000003', 'W00000003', N'Mô hình dự đoán bồi thường', 'v2.0', N'Dự đoán số tiền bồi thường Đà Nẵng', 'Regression', '2023-01-12', 'Active'),
('M00000004', 'W00000004', N'Mô hình phân tích giao dịch ví điện tử', 'v1.1', N'Phân tích hành vi giao dịch DigiTech', 'Clustering', '2023-01-13', 'Active'),
('M00000005', 'W00000005', N'Mô hình kiểm toán rủi ro', 'v3.0', N'Đánh giá rủi ro kiểm toán toàn cầu', 'DecisionTree', '2023-01-14', 'Active');

INSERT INTO CREDIT_PROFILE (
    ProfileID,
    WarehouseID,
    UserID,
    TotalTransactions,
    TotalDebt,
    AvgIncome,
    AvgSpending,
    RiskLevel,
    LastUpdated,
    DataCoverage,
    ProfileStatus,
    Version
)
VALUES
('CP0000001','W00000001','U00000001',120,5000.50,2000.00,1500.00,'Low','2023-01-10 09:30:00',95.50,'Active','v1.0'),
('CP0000002','W00000002','U00000002',250,12000.00,5000.00,4000.00,'Medium','2023-01-11 14:45:00',90.00,'Active','v1.1'),
('CP0000003','W00000003','U00000003',80,2000.00,1500.00,1200.00,'Low','2023-01-12 08:15:00',85.00,'Inactive','v1.0'),
('CP0000004','W00000004','U00000004',300,25000.00,7000.00,5000.00,'High','2023-01-13 11:20:00',92.50,'Active','v1.2'),
('CP0000005','W00000005','U00000005',50,1000.00,1200.00,900.00,'Low','2023-01-14 10:10:00',80.00,'Inactive','v1.0');

INSERT INTO CALCULATION (
    CalcID,
    ProfileID,
    ModelID,
    CalculationDate,
    InputDataVolume,
    OutputScore,
    Notes
)
VALUES
('C00000001', 'CP0000001', 'M00000001', '2023-01-15', 500, 750.50, N'Tính toán tín dụng cho khách hàng Hà Nội'),
('C00000002', 'CP0000002', 'M00000002', '2023-01-16', 1200, 620.75, N'Phân loại khách hàng TP.HCM'),
('C00000003', 'CP0000003', 'M00000003', '2023-01-17', 300, 880.00, N'Dự đoán bồi thường Đà Nẵng'),
('C00000004', 'CP0000004', 'M00000004', '2023-01-18', 1500, 540.25, N'Phân tích giao dịch ví điện tử DigiTech'),
('C00000005', 'CP0000005', 'M00000005', '2023-01-19', 200, 970.10, N'Đánh giá rủi ro kiểm toán toàn cầu');

INSERT INTO PERFORMANCE (
    PerformanceID,
    ModelID,
    CalcID,
    EvaluationDate,
    Accuracy,
    StabilityIndex,
    DataDriftScore,
    Precision,
    Recall,
    Notes
)
VALUES
('PF0000001', 'M00000001', 'C00000001', '2023-01-20', 95.50, 90.00, 2.50, 96.00, 94.50, N'Đánh giá hiệu suất mô hình tín dụng Hà Nội'),
('PF0000002', 'M00000002', 'C00000002', '2023-01-21', 92.75, 88.00, 3.10, 93.50, 92.00, N'Đánh giá mô hình phân loại khách hàng TP.HCM'),
('PF0000003', 'M00000003', 'C00000003', '2023-01-22', 89.00, 85.50, 4.20, 90.00, 88.50, N'Đánh giá mô hình dự đoán bồi thường Đà Nẵng'),
('PF0000004', 'M00000004', 'C00000004', '2023-01-23', 94.25, 89.00, 2.75, 95.00, 93.50, N'Đánh giá mô hình giao dịch ví điện tử DigiTech'),
('PF0000005', 'M00000005', 'C00000005', '2023-01-24', 91.50, 87.00, 3.50, 92.00, 91.00, N'Đánh giá mô hình kiểm toán toàn cầu');

INSERT INTO CREDIT_SCORE (
    ScoreID,
    ProfileID,
    ModelID,
    ScoreValue,
    ScoreConfidence,
    RiskCategory,
    LastCalculated,
    Status
)
VALUES
('CS0000001', 'CP0000001', 'M00000001', 750, 95.50, 'Low Risk', '2023-01-25 10:00:00', 'Active'),
('CS0000002', 'CP0000002', 'M00000002', 620, 90.00, 'Medium Risk', '2023-01-25 10:30:00', 'Active'),
('CS0000003', 'CP0000003', 'M00000003', 880, 92.75, 'Low Risk', '2023-01-25 11:00:00', 'Inactive'),
('CS0000004', 'CP0000004', 'M00000004', 540, 88.50, 'High Risk', '2023-01-25 11:30:00', 'Active'),
('CS0000005', 'CP0000005', 'M00000005', 970, 96.00, 'Low Risk', '2023-01-25 12:00:00', 'Active');

INSERT INTO CREDIT_FACTOR (
    FactorID,
    ScoreID,
    FactorName,
    FactorWeight,
    FactorValue,
    FactorImpact
)
VALUES
('CF0000001', 'CS0000001', N'Income Stability', 30.00, 2000.00, 'Positive'),
('CF0000002', 'CS0000001', N'Debt Ratio', 25.00, 5000.00, 'Negative'),
('CF0000003', 'CS0000002', N'Transaction Volume', 20.00, 1200.00, 'Positive'),
('CF0000004', 'CS0000003', N'Credit History', 15.00, 880.00, 'Positive'),
('CF0000005', 'CS0000004', N'Payment Timeliness', 10.00, 540.00, 'Positive');

INSERT INTO B2B_CLIENT (
    ClientID,
    ClientName,
    ClientType,
    TaxCode,
    BusinessLicenseNo,
    Address,
    Email,
    Phone,
    RegisterDate,
    Status
)
VALUES
('CL0000001', N'Công ty Vay Vốn Minh An', 'Finance', 'TAX111111', 'BL001', N'12 Phố Huế, Hà Nội', 'contact@minhan.vn', '0912345671', '2023-01-05', 'Active'),
('CL0000002', N'Quỹ Đầu Tư Phát Triển Việt', 'Investment', 'TAX222222', 'BL002', N'34 Lê Lai, TP.HCM', 'contact@qdtptv.vn', '0912345672', '2023-01-06', 'Active'),
('CL0000003', N'Công ty Tài Chính An Bình', 'Finance', 'TAX333333', 'BL003', N'56 Nguyễn Trãi, Đà Nẵng', 'contact@anbinh.vn', '0912345673', '2023-01-07', 'Active'),
('CL0000004', N'Quỹ Đầu Tư Toàn Cầu', 'Investment', 'TAX444444', 'BL004', N'78 Trần Hưng Đạo, Hà Nội', 'contact@toanquoc.vn', '0912345674', '2023-01-08', 'Active'),
('CL0000005', N'Công ty Vay Vốn Sài Gòn', 'Finance', 'TAX555555', 'BL005', N'90 Hai Bà Trưng, TP.HCM', 'contact@vsaigon.vn', '0912345675', '2023-01-09', 'Active');

INSERT INTO SERVICE_AGREEMENT (
    AgreementID,
    ClientID,
    StartDate,
    EndDate,
    ServiceLevel,
    QueryLimit,
    FeePerQuery,
    ContractType,
    Status
)
VALUES
('A00000001', 'CL0000001', '2023-01-10', '2024-01-09', 'Premium', 1000, 5.00, 'Annual', 'Active'),
('A00000002', 'CL0000002', '2023-02-01', '2024-01-31', 'Standard', 500, 7.50, 'Annual', 'Active'),
('A00000003', 'CL0000003', '2023-03-15', NULL, 'Premium', 1500, 6.00, 'Monthly', 'Active'),
('A00000004', 'CL0000004', '2023-04-01', '2024-03-31', 'Standard', 800, 7.00, 'Annual', 'Active'),
('A00000005', 'CL0000005', '2023-05-20', NULL, 'Premium', 1200, 5.50, 'Monthly', 'Active');

INSERT INTO SCORE_QUERY (
    QueryID,
    ScoreID,
    AgreementID,
    ProfileID,
    QueryDate,
    QueryResult,
    QueryStatus,
    RiskCategory,
    Recommendation
)
VALUES
('Q0000001', 'CS0000001', 'A00000001', 'CP0000001', '2023-06-01 10:15:00', N'Credit Score: 750', 'Completed', 'Low Risk', N'Approve loan'),
('Q0000002', 'CS0000002', 'A00000002', 'CP0000002', '2023-06-02 11:30:00', N'Credit Score: 620', 'Completed', 'Medium Risk', N'Monitor closely'),
('Q0000003', 'CS0000003', 'A00000003', 'CP0000003', '2023-06-03 14:45:00', N'Credit Score: 880', 'Completed', 'Low Risk', N'Approve loan'),
('Q0000004', 'CS0000004', 'A00000004', 'CP0000004', '2023-06-04 09:20:00', N'Credit Score: 540', 'Completed', 'High Risk', N'Reject loan'),
('Q0000005', 'CS0000005', 'A00000005', 'CP0000005', '2023-06-05 15:50:00', N'Credit Score: 970', 'Completed', 'Low Risk', N'Approve with conditions');

INSERT INTO INVOICE (
    InvoiceID,
    AgreementID,
    ClientID,
    InvoiceDate,
    TotalQueries,
    TotalAmount,
    PaymentMethod,
    DueDate,
    PaymentStatus
)
VALUES
('I0000001', 'A00000001', 'CL0000001', '2023-06-05', 950, 4750.00, 'Bank Transfer', '2023-06-20', 'Paid'),
('I0000002', 'A00000002', 'CL0000002', '2023-06-06', 480, 3600.00, 'Credit Card', '2023-06-21', 'Unpaid'),
('I0000003', 'A00000003', 'CL0000003', '2023-06-07', 1500, 9000.00, 'Bank Transfer', '2023-06-22', 'Paid'),
('I0000004', 'A00000004', 'CL0000004', '2023-06-08', 800, 5600.00, 'Cash', '2023-06-23', 'Unpaid'),
('I0000005', 'A00000005', 'CL0000005', '2023-06-09', 1200, 6600.00, 'Bank Transfer', '2023-06-24', 'Paid');

---Đừng xóa dòng code tạo bảng bà hãy bay xuống tiếp tục code luôn nha


---CODE TRUY VẤN tiếp tục:
-- ============================================================
-- PHẦN 1: TRUY VẤN CƠ BẢN VỀ NGƯỜI DÙNG VÀ ĐỐI TÁC
-- ============================================================


-- Câu 1: Liệt kê danh sách các Đối tác (Partner) đang hoạt động (Status = 'Active')
-- Mục đích: Kiểm tra xem đối tác nào đang làm ăn tốt.
SELECT PartnerID, PartnerName, Email, Phone 
FROM DATA_PARTNER 
WHERE Status = 'Active';


-- Câu 2: Tìm thông tin những người dùng sinh trước năm 1990
-- Mục đích: Lọc nhóm khách hàng lớn tuổi.
SELECT UserID, FullName, DateOfBirth, Address 
FROM USER_PROFILE 
WHERE DateOfBirth < '1990-01-01';


-- Câu 3: Liệt kê các App thuộc lĩnh vực 'Financial' hoặc 'Banking'
-- Mục đích: Xem các ứng dụng chủ lực về tài chính.
SELECT AppName, AppType, ActiveStatus 
FROM FINTECH_APP 
WHERE AppType IN ('Financial', 'Banking');


-- Câu 4: Hiển thị danh sách kho dữ liệu (Data Warehouse) và sức chứa của chúng
-- Mục đích: Quản lý hạ tầng lưu trữ.
SELECT WarehouseName, StoragePath, Capacity 
FROM DATA_WAREHOUSE 
ORDER BY Capacity DESC;


-- ============================================================
-- PHẦN 2: TRUY VẤN KẾT HỢP (JOIN) - TÍN DỤNG & RỦI RO
-- ============================================================


-- Câu 5: Xem điểm tín dụng và mức độ rủi ro của từng người dùng
-- Mục đích: Đánh giá ai uy tín, ai rủi ro cao.
SELECT 
    U.FullName, 
    CS.ScoreValue, 
    CS.RiskCategory, 
    CS.LastCalculated
FROM USER_PROFILE U
JOIN CREDIT_PROFILE CP ON U.UserID = CP.UserID
JOIN CREDIT_SCORE CS ON CP.ProfileID = CS.ProfileID;


-- Câu 6: Lọc ra những người dùng có điểm tín dụng CAO (> 800)
-- Mục đích: Tìm khách hàng VIP để mời chào vay vốn.
SELECT 
    U.FullName, 
    CS.ScoreValue, 
    CS.RiskCategory 
FROM USER_PROFILE U
JOIN CREDIT_PROFILE CP ON U.UserID = CP.UserID
JOIN CREDIT_SCORE CS ON CP.ProfileID = CS.ProfileID
WHERE CS.ScoreValue > 800;


-- Câu 7: Ai là người đang bị xếp loại 'High Risk' (Rủi ro cao)?
-- Mục đích: Khoanh vùng để theo dõi nợ xấu.
SELECT 
    U.FullName, 
    U.Phone, 
    CS.ScoreValue 
FROM USER_PROFILE U
JOIN CREDIT_PROFILE CP ON U.UserID = CP.UserID
JOIN CREDIT_SCORE CS ON CP.ProfileID = CS.ProfileID
WHERE CS.RiskCategory = 'High Risk';


-- Câu 8: Xem chi tiết các khoản nợ (TotalDebt) của người dùng ở TP.HCM
-- Mục đích: Đánh giá dư nợ theo khu vực địa lý.
SELECT 
    U.FullName, 
    U.Address, 
    CP.TotalDebt 
FROM USER_PROFILE U
JOIN CREDIT_PROFILE CP ON U.UserID = CP.UserID
WHERE U.Address LIKE N'%TP. Hồ Chí Minh%';


-- ============================================================
-- PHẦN 3: THỐNG KÊ & BÁO CÁO DOANH THU (AGGREGATE)
-- ============================================================


-- Câu 9: Thống kê tổng số tiền nợ (TotalDebt) của tất cả khách hàng
-- Mục đích: Xem tổng quy mô nợ đang quản lý.
SELECT SUM(TotalDebt) AS TongNoToanHeThong 
FROM CREDIT_PROFILE;


-- Câu 10: Đếm số lượng người dùng theo từng mức độ rủi ro (Low/Medium/High)
-- Mục đích: Xem phân bổ rủi ro của hệ thống.
SELECT 
    RiskCategory, 
    COUNT(ScoreID) AS SoLuongNguoi 
FROM CREDIT_SCORE 
GROUP BY RiskCategory;


-- Câu 11: Tính điểm tín dụng trung bình của tất cả người dùng
-- Mục đích: Xem mặt bằng chung điểm số.
SELECT AVG(ScoreValue) AS DiemTinDungTrungBinh 
FROM CREDIT_SCORE;


-- Câu 12: Tìm người có tổng chi tiêu (AvgSpending) cao nhất
-- Mục đích: Tìm khách hàng "sộp" nhất.
SELECT TOP 1 
    U.FullName, 
    CP.AvgSpending 
FROM USER_PROFILE U
JOIN CREDIT_PROFILE CP ON U.UserID = CP.UserID
ORDER BY CP.AvgSpending DESC;


-- ============================================================
-- PHẦN 4: NGHIỆP VỤ B2B & THANH TOÁN (NÂNG CAO)
-- ============================================================


-- Câu 13: Liệt kê các hóa đơn ĐÃ THANH TOÁN (Paid) và tên công ty khách hàng
-- Mục đích: Báo cáo doanh thu thực thu.
SELECT 
    C.ClientName, 
    I.InvoiceID, 
    I.TotalAmount, 
    I.InvoiceDate 
FROM B2B_CLIENT C
JOIN INVOICE I ON C.ClientID = I.ClientID
WHERE I.PaymentStatus = 'Paid';


-- Câu 14: Tổng hợp doanh thu từ từng Khách hàng doanh nghiệp (B2B)
-- Mục đích: Xem công ty nào đóng góp nhiều tiền nhất.
SELECT 
    C.ClientName, 
    SUM(I.TotalAmount) AS TongDoanhThu 
FROM B2B_CLIENT C
JOIN INVOICE I ON C.ClientID = I.ClientID
GROUP BY C.ClientName;


-- Câu 15: Kiểm tra các hợp đồng dịch vụ sẽ hết hạn trong năm 2024
-- Mục đích: Chuẩn bị kế hoạch tái ký hợp đồng.
SELECT 
    C.ClientName, 
    SA.EndDate, 
    SA.ServiceLevel 
FROM SERVICE_AGREEMENT SA
JOIN B2B_CLIENT C ON SA.ClientID = C.ClientID
WHERE YEAR(SA.EndDate) = 2024;


-- Câu 16: Liệt kê lịch sử truy vấn điểm (Score Query) diễn ra trong tháng 6/2023
-- Mục đích: Kiểm tra hoạt động hệ thống trong tháng cao điểm.
SELECT 
    Q.QueryID, 
    Q.QueryDate, 
    Q.QueryResult 
FROM SCORE_QUERY Q
WHERE Q.QueryDate BETWEEN '2023-06-01' AND '2023-06-30';


-- Câu 17: Cho biết Mô hình (Model) nào được sử dụng để tính điểm cho khách hàng 'Nguyễn Văn An'
-- Mục đích: Truy xuất nguồn gốc thuật toán.
SELECT 
    U.FullName, 
    M.ModelName, 
    M.AlgorithmType 
FROM USER_PROFILE U
JOIN CREDIT_PROFILE CP ON U.UserID = CP.UserID
JOIN CALCULATION C ON CP.ProfileID = C.ProfileID
JOIN MODEL M ON C.ModelID = M.ModelID
WHERE U.FullName = N'Nguyễn Văn An';




























