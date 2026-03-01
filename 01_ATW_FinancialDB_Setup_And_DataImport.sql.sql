CREATE DATABASE FinancialDataDB;
GO

USE FinancialDataDB;
GO




CREATE TABLE ATW_financial_data (
    [date] DATE,
    [close] FLOAT,
    [open] FLOAT,
    [high] FLOAT,
    [low] FLOAT,
    [volume] FLOAT,
    [pct_change] FLOAT,
    [daily_return] FLOAT,
    [cumulative_return] FLOAT,
    [drawdown] FLOAT,
    [ma20] FLOAT,
    [ma50] FLOAT,
    [ma200] FLOAT
);
GO

-- Test CSV avec point-virgule
BEGIN TRY
    BULK INSERT ATW_financial_data
    FROM 'C:\SQLDatanew\ATW_financial_final_cleaned.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '0x0a',
        CODEPAGE = '65001',
        TABLOCK
    );
    PRINT 'Import fonctionne';
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
END CATCH;



SELECT * FROM ATW_financial_data;