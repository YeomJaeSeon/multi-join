use blog;

# 문제 상황

select *
from main_tb
#      a정보를 위한 조인
         join sub1_tb1 s1t1 on main_tb.id = s1t1.main_tb_id
         join sub1_tb2 s1t2 on s1t1.id = s1t2.sub1_tb1_id
         join sub1_tb3 s1t3 on s1t2.id = s1t3.sub1_tb2_id
#      b정보를 위한 조인
         join sub2_tb1 s2t1 on main_tb.id = s2t1.main_tb_id
         join sub2_tb2 s2t2 on s2t1.id = s2t2.sub2_tb1_id
         join sub2_tb3 s2t3 on s2t2.id = s2t3.sub2_tb2_id
#      c정보를 위한 조인
         join sub3_tb1 s3t1 on main_tb.id = s3t1.main_tb_id
         join sub3_tb2 s3t2 on s3t1.id = s3t2.sub3_tb1_id
         join sub3_tb3 s3t3 on s3t2.id = s3t3.sub3_tb2_id
where main_tb.id = 1;
# 5^9 개의 레코드 반환
# 34 sec..

# 해결방법. - 쿼리 분리
select *
from main_tb
#      a정보를 위한 조인
         join sub1_tb1 s1t1 on main_tb.id = s1t1.main_tb_id
         join sub1_tb2 s1t2 on s1t1.id = s1t2.sub1_tb1_id
         join sub1_tb3 s1t3 on s1t2.id = s1t3.sub1_tb2_id

select *
from main_tb
#      b정보를 위한 조인
         join sub2_tb1 s2t1 on main_tb.id = s2t1.main_tb_id
         join sub2_tb2 s2t2 on s2t1.id = s2t2.sub2_tb1_id
         join sub2_tb3 s2t3 on s2t2.id = s2t3.sub2_tb2_id

select *
from main_tb
#      c정보를 위한 조인
         join sub3_tb1 s3t1 on main_tb.id = s3t1.main_tb_id
         join sub3_tb2 s3t2 on s3t1.id = s3t2.sub3_tb1_id
         join sub3_tb3 s3t3 on s3t2.id = s3t3.sub3_tb2_id