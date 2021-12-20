SET NOCOUNT ON;

SELECT 1                 AS officeId,
       u.staffcode       AS EmpCode,
       t.transactiondate AS AttDateTime
FROM   
	hris_revamp.dbo.vw_ims_transaction t WITH (nolock)
    INNER JOIN hris_revamp.dbo.vw_ims_user u WITH (nolock)
            ON Isnull(t.userid, 0) = u.userid
            AND Isnumeric(staffcode) = 1
WHERE  
	u.staffcode = 2382
	AND Cast (t.transactiondate AS DATE) >= Cast (Getdate() AS DATE)
	
ORDER  BY t.transactiondate ASC

GO