SELECT *
FROM MEMBER
WHERE member_name = '홍길동';

SELECT *
FROM MEMBER
WHERE member_addr = '서울 관악*';

SELECT *
FROM MEMBER
WHERE member_email = 'user1@naver.com';

INSERT INTO admin 
VALUES ('admin123', '#Abcd1234', '홍길동', '010-1234-5678', 'abcd@abcd.com', '2');

ALTER TABLE MEMBER 
ADD agree_check NUMBER(1) DEFAULT 1;

INSERT INTO faq
VALUES ('15', 'admin_user', '자주묻는질문', '내용입니다', '0');


------------------------------------------------------------------------------------------------

-- getFaqBySearch
SELECT * FROM (
                    SELECT
                           m.*,
                           FLOOR((ROWNUM - 1)/10 + 1) page
                    FROM (
                             SELECT * FROM faq
							
							WHERE faq_title like '%' || '제목' || '%'
							
                            ORDER BY faq_id DESC
                      	 ) m
        )
 WHERE page = 2;
 
 SELECT * FROM (
                    SELECT
                           m.*,
                           FLOOR((ROWNUM - 1)/10 + 1) page
                    FROM (
                             SELECT * FROM faq
							
							WHERE faq_content like '%' || '동우' || '%'
							
                            ORDER BY faq_id DESC
                      	 ) m
        )
 WHERE page = 1;
     	
 
 SELECT * FROM (
                    SELECT
                           m.*,
                           FLOOR((ROWNUM - 1)/10 + 1) page
                    FROM (
                             SELECT * FROM faq
							
							WHERE member_id like '%' || 'oracle' || '%'
							
                            ORDER BY faq_id DESC
                      	 ) m
        )
 WHERE page = 1;
 
 
 
 
 -- getAllFaqsBySearch
 
  SELECT COUNT(*) FROM (
                    SELECT
                           m.*
                           
                    FROM (
                             SELECT * FROM faq
							
							WHERE faq_title like '%' || '제목' || '%'
							
                            ORDER BY faq_id DESC
                      	 ) m
        );
 
       
       
-- isEnableEmailByIdAndEmail

       SELECT count(*)
		  FROM (SELECT member_email
			      FROM member
			     WHERE member_id != 'qwer1234')
		 WHERE member_email = 'user56@abcd.com';

	
-- isEnableCellphoneByIdAndCellphone
		SELECT count(*)
		  FROM (SELECT member_cellphone
			      FROM member
			     WHERE member_id != 'qwer1234')
		 WHERE member_cellphone = '010-1234-1056';
		
		
-- updateMember
		UPDATE member 
		   SET member_pw='!Qqwer1234',
			   member_email='test1234@naver.com',
			   member_phone='031-1234-4567',
		   	   member_cellphone='010-2222-3333',
			   member_zip='06362',
			   member_addr='서울 강남구 밤고개로 76-2 (수서동)',
			   member_addr_detail='1111',
			   sms_check='Y',
			   email_check='N',
			   forever_check='Y'
		 WHERE member_id='test1234'
		 
SELECT * FROM (
                    SELECT
                           m.*,
                           FLOOR((ROWNUM - 1)/10 + 1) page
                    FROM (
                             SELECT * FROM (
                             	
                             	SELECT * FROM qna_product
                             	
                             	WHERE qna_product_date BETWEEN TO_CHAR(SYSDATE-7) AND TO_CHAR(SYSDATE+1)
                             	
                             )
							
							WHERE qna_product_title like '%' || '테스트' || '%'
							
                            ORDER BY qna_product_id DESC
                      	 ) m
        )
     	WHERE page = 1;
     	
SELECT * FROM (
	SELECT
		m.*,
		FLOOR((ROWNUM - 1)/10 + 1) page
        FROM (
        	SELECT * FROM product
            ORDER BY product_id DESC
        ) m
)
WHERE page = 1;

-- 상품 검색 총 수
SELECT COUNT(*) FROM (
	SELECT m.* FROM (
		SELECT * FROM product
		WHERE product_name like '%' || '셔츠' || '%'
        ORDER BY product_id DESC
	) m
);

SELECT COUNT(*) FROM product;

SELECT (SELECT NVL(MAX(faq_id),151) FROM faq WHERE faq_id < 151),
		   (SELECT NVL(MIN(faq_id),151) FROM faq WHERE faq_id > 151)
	FROM dual;

SELECT (SELECT NVL(MAX(qna_product_id),5) 
		  FROM qna_product 
		 WHERE qna_product_id < 5  AND qna_product_re_lev = 0)
  FROM dual;

 
SELECT * FROM (
            SELECT
                   m.*,
                   FLOOR((ROWNUM - 1)/12 + 1) page
            FROM (
                     SELECT 
						p.product_id, p.product_name, c.cate_code, c.cate_name,
						p.product_price2, p.product_list_img, p.product_color 
					  FROM product p
							INNER JOIN category c
									ON p.cate_code = c.cate_code
					 WHERE c.cate_code = 101
					 ORDER BY product_id DESC 
              	 ) m
)
WHERE page = 2;

SELECT COUNT(*) 
  FROM product
 WHERE cate_code = 101;


-- orderlist
SELECT *
  FROM orders
 ORDER BY order_date ASC
 
-- orderDetail
	    SELECT o.order_id, o.member_id, o.order_name, o.order_zip, o.order_addr,
				   o.order_addr_detail, o.order_phone, o.order_cellphone, o.order_msg,
				   o.order_date, o.order_delivery, o.ORDER_amount,
	   			   d.order_detail_id, d.product_id, d.cart_quan, d.cart_color, d.cart_size,
	   			   p.product_name, p.product_img,
	   			   m.member_name, m.member_cellphone
  			  FROM orders o
		INNER JOIN order_detail d
	            ON o.order_id = d.order_id
	    INNER JOIN product p
	    		ON d.product_id = p.product_id
	    INNER JOIN member m
	  			ON o.member_id = m.member_id
	  	     WHERE o.order_id = '20200219-000001';
	        
-- orderList 
		SELECT o.order_id, o.member_id, o.order_name, o.order_zip, o.order_addr,
			   o.order_addr_detail, o.order_phone, o.order_cellphone, o.order_msg,
			   o.order_date, o.order_delivery, o.ORDER_amount,
   			   d.order_detail_id, d.product_id, d.cart_quan, d.cart_color, d.cart_size,
   			   p.product_name, p.product_thum_img, p.product_list_img
		  FROM orders o
	INNER JOIN order_detail d
		    ON o.order_id = d.order_id
	INNER JOIN product p
			ON d.product_id = p.product_id
		 WHERE member_id = 'qwer1234'
	  ORDER BY o.order_date DESC 
--
	     SELECT d.order_id
	       FROM order_detail 
INSERT INTO orders 
	   ( order_id, 
		 member_id, 
		 order_name, 
		 order_zip, 
		 order_addr, 
		 order_addr_detail, 
		 order_phone, 
		 order_cellphone, 
		 order_msg, 
		 order_amount )
VALUES ( '20200218_123456',
		 'admin_user',
		 '홍길동',
		 '12345',
		 '서울시 구로구',
		 '101호',
		 '02-1234-1234',
		 '010-1234-1234',
		 'test',
		 50000 )
		 
INSERT INTO order_detail 
	   ( order_detail_id, 
		 order_id, 
		 product_id, 
		 cart_quan,
		 cart_color,
		 cart_size)

SELECT order_detail_seq.NEXTVAL,
	   '20200218_123456',
	   41,
	   1,
	   'red',
	   '100'
  FROM cart;

-- cart 개별 조회
SELECT TO_DATE(cart_date,
               		'YY-MM-dd','NLS_DATE_LANGUAGE = American')
  FROM cart
 WHERE product_id = 62;

SELECT TO_DATE('2020-02-19',
               		'YY-MM-dd','NLS_DATE_LANGUAGE = American')
FROM DUAL;
 
SELECT *
  FROM cart
 WHERE product_id = 62
   AND cart_color = 'red'
   AND cart_size = '95'
   AND TO_DATE(cart_date, 'YY-MM-dd','NLS_DATE_LANGUAGE = American') = 
       TO_DATE('2020-02-19', 'YY-MM-dd','NLS_DATE_LANGUAGE = American')
   AND member_id = 'admin_user'
   ORDER BY cart_id DESC;  
   
-- 개별 카트 조회
SELECT ROW_NUMBER() OVER(ORDER BY c.cart_id DESC) AS cartListNum,
	c.cart_id, c.member_id, c.product_id, c.cart_quan, c.cart_date, c.cart_color, c.cart_size,
	p.product_name, p.product_price2, p.product_thum_img, p.product_delivery_fee
FROM cart c
	INNER JOIN product p
	   ON c.product_id = p.product_id
	WHERE c.member_id = 'admin_user'
	  AND p.product_id = 62
	  AND p.product_color = 'red'
	  AND p.product_size = '95'
	  AND TO_DATE(cart_date, 'YY-MM-dd','NLS_DATE_LANGUAGE = American') = 
		  TO_DATE('2020-02-19', 'YY-MM-dd','NLS_DATE_LANGUAGE = American')
	ORDER BY c.cart_id DESC;
	
SELECT SUM(p.product_price2 * c.cart_quan)
  FROM cart c
 INNER JOIN product p
	ON c.product_id = p.product_id
 WHERE member_id = 'admin_user';
 
-- 개별 카트 조회 2 cart_id로 가져오기
SELECT ROW_NUMBER() OVER(ORDER BY c.cart_id DESC) AS cartListNum,
	c.cart_id, c.member_id, c.product_id, c.cart_quan, c.cart_date, c.cart_color, c.cart_size,
	p.product_name, p.product_price2, p.product_thum_img, p.product_delivery_fee
FROM cart c
	INNER JOIN product p
	   ON c.product_id = p.product_id
	WHERE c.cart_id = 116
	ORDER BY c.cart_id DESC;
	
-- 최근 cart seq 가져오기
SELECT MAX(cart_id) FROM cart;


-- 주문 상태처리 변경
	UPDATE orders 
		   SET order_delivery = '배송 준비중'
		 WHERE order_id= '20200220-000002'

		 
-- 주문 완료 후 해당 상품 재고 수량 감소
	UPDATE product
	   SET product_quan = product_quan - '1'
	 WHERE product_id = '2' 
	 
-- 주문 
	 SELECT * FROM (
			SELECT
				m.*,
				FLOOR((ROWNUM - 1)/10 + 1) page
	          FROM (
		        	SELECT * 
		        	  FROM orders
		             ORDER BY order_id DESC
		        ) m
		)
		WHERE page = 1;
	
	 SELECT * FROM (
			SELECT
				m.*,
				FLOOR((ROWNUM - 1)/10 + 1) page
	          FROM (
		        	SELECT * 
		        	  FROM orders
		             ORDER BY order_id DESC
		        ) m
		)
		WHERE page = 1;
	
	
	SELECT * FROM (
			SELECT
				m.*,
				FLOOR((ROWNUM - 1)/10 + 1) page
	          FROM (
		        	SELECT * 
		        	  FROM orders
		             ORDER BY order_id DESC
		        ) m
		)
		WHERE page = 1;
	
	SELECT COUNT(*) 
		  FROM orders
		  
	
	SELECT *
	  FROM orders
	 WHERE order_delivery = '배송 중';
	
	SELECT COUNT(*)
	  FROM orders
	 WHERE order_delivery = '배송준비중';
	
	
	SELECT *
		FROM order_detail
		WHERE order_id = '20200220-000001'
		
	SELECT o.order_id, o.member_id, o.order_name, o.order_zip, o.order_addr,
				   o.order_addr_detail, o.order_phone, o.order_cellphone, o.order_msg,
				   o.order_date, o.order_delivery, o.ORDER_amount,
	   			   d.order_detail_id, d.product_id, d.cart_quan, d.cart_color, d.cart_size,
	   			   p.product_name, p.product_thum_img, p.product_list_img
			  FROM orders o
		INNER JOIN order_detail d
			    ON o.order_id = d.order_id
		INNER JOIN product p
		        ON d.product_id = p.product_id
			 WHERE member_id = 'qwer1234';
			
			
			SELECT d.order_id, o.member_id, o.order_name, o.order_zip, o.order_addr,
				   o.order_addr_detail, o.order_phone, o.order_cellphone, o.order_msg,
				   o.order_date, o.order_delivery, o.ORDER_amount,
	   			   d.order_detail_id, d.product_id, d.cart_quan, d.cart_color, d.cart_size,
	   			   p.product_name, p.product_thum_img, p.product_list_img
			  FROM order_detail d
		INNER JOIN orders o
			    ON d.order_id = o.order_id
		INNER JOIN product p
		        ON d.product_id = p.product_id
			 WHERE member_id = 'qwer1234';
		
			
	SELECT *
	  FROM order_detail d
INNER JOIN orders o
		ON d.order_id = o.order_id
	 WHERE member_id = 'qwer1234';
	
	SELECT o.order_id, o.member_id, o.order_name, o.order_zip, o.order_addr,
				   o.order_addr_detail, o.order_phone, o.order_cellphone, o.order_msg,
				   o.order_date, o.order_delivery, o.order_amount,
	   			   d.order_detail_id, d.product_id, d.cart_quan, d.cart_color, d.cart_size,
	   			   p.product_name, p.product_thum_img, p.product_list_img, p.product_price2
			  FROM orders o
		INNER JOIN order_detail d
			    ON o.order_id = d.order_id
		INNER JOIN product p
		        ON d.product_id = p.product_id
			 WHERE member_id = 'qwer1234'
		  
	
	SELECT o.order_id, o.member_id, o.order_name, o.order_zip, o.order_addr,
				   o.order_addr_detail, o.order_phone, o.order_cellphone, o.order_msg,
				   o.order_date, o.order_delivery, o.order_amount,
	   			   d.order_detail_id, d.product_id, d.cart_quan, d.cart_color, d.cart_size,
	   			   p.product_name, p.product_thum_img, p.product_list_img, p.product_price2,
	   			   m.member_name, m.member_cellphone
  			  FROM orders o
		INNER JOIN order_detail d
	            ON o.order_id = d.order_id
	    INNER JOIN product p
	    		ON d.product_id = p.product_id
	    INNER JOIN member m
	    		ON o.member_id = m.member_id
	  	     WHERE o.order_id = '20200221_143449'
	  	     
	UPDATE member 
		   SET member_pw='#Abcd1234'
		 WHERE member_id='qwer1234'