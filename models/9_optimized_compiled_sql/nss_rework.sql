WITH NSS_Rework AS (
select * from {{ ref('stg_nss_rework') }}
)
SELECT 
  NSS_Rework.*
  
  /*
  ,DENSE_RANK() OVER(ORDER BY "Transaction Date"
    ,"Part Number"
    ,"Work Order"
    ,"Serial Number"
  ) AS "GROUP"
  */
  ,DENSE_RANK() OVER(ORDER BY "Transaction Date"
    ,"Part Number"
    ,"Work Order"
    ,"Serial Number"
  ) AS "Rank_Group"
  ,ROW_NUMBER() OVER (PARTITION BY "Transaction Date"
    ,"Part Number"
    ,"Work Order"
    ,"Serial Number"
    ORDER BY "Rate_Type" DESC
    ,"CoPQ Type" DESC
    ,"Defect_Code" ASC
    ,"Def_Detail_ID" ASC
  ) AS "ROW NUMBER"
FROM NSS_Rework;