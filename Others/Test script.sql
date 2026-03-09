/* 
Script này được chạy lần lượt các dòng chỉ khi tương thích các điều kiện của nó 
Không dùng script để chạy f5 một lần duy nhất
*/
use QLBongDa
go
-- Script thử nghiệm cho BDU03:
Select * from CAULACBO -- được xem
Select * from CAUTHU -- bị từ chối

-- Script thử nghiệm cho BDU04:
-- xem cột ngày sinh
Select NGAYSINH FROM CAUTHU
-- xem các cột khác
SELECT MACT,HOTEN,VITRI,DIACHI,MACLB,MAQG,SO FROM CAUTHU

-- Câu e,f: thử nghiệm xem 2 store procedure
-- dùng sp_helptext, nếu hiện code của sp -> chưa mã hóa và ngược lại
EXEC sp_helptext 'SP_SEL_NO_ENCRYPT'
EXEC sp_helptext 'SP_SEL_ENCRYPT'

-- Câu g: chạy SP
EXEC SP_SEL_NO_ENCRYPT N'SHB Đà Nẵng', N'Brazil'
EXEC SP_SEL_ENCRYPT N'SHB Đà Nẵng', N'Brazil'


-- Câu j: chạy các sp theo yêu cầu
EXECUTE AS USER = 'BDRead';
EXEC SPCau1 N'SHB Đà Nẵng', N'Brazil';
EXEC SPCau9 3, 2009;
REVERT;

EXECUTE AS USER = 'BDU01';
EXEC SPCau3 N'Việt Nam';
EXEC SPCau10 3, 2009;
REVERT;

EXECUTE AS USER = 'BDU03';
EXEC SPCau1 N'SHB Đà Nẵng', N'Brazil';
EXEC SPCau10 3, 2009;
EXEC SPCau3 N'Việt Nam';
EXEC SPCau4 N'Việt Nam';
REVERT;

EXECUTE AS USER = 'BDU04';
EXEC SPCau1 N'SHB Đà Nẵng', N'Brazil';
EXEC SPCau10 3, 2009;
EXEC SPCau3 N'Việt Nam';
EXEC SPCau4 N'Việt Nam';
REVERT;
