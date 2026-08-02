Use customer_behavior
-- 1.  Total Revenue by Gender - MALE & FEMALE
Select gender ,sum(purchase_amount) as revenue 
from customer group by gender

-- 2. Discounted but still spent more than the average purchase amount 
select customer_id , purchase_amount from customer 
where discount_applied = 'Yes' and purchase_amount >= (select Avg(purchase_amount) from customer)

-- 3. Top 5 products by highest avg review rating 
select top 5 item_purchased ,Round(Avg(review_rating),2) as Average_Review_Rating from customer
group by item_purchased
order by Avg(review_rating) desc 

-- 4. Comparing avgg purchase_amount by Standard and Express Shipping
select shipping_type, round(avg(purchase_amount),2) from customer
where shipping_type in ('Standard' ,'Express')
group by shipping_type

-- 5. Comparison between subscribed and non subscribed based on spendings 
select subscription_status,
count(customer_id) as total_customers ,
round(AVG(purchase_amount),2) as  avg_spendings, 
round(SUM(purchase_amount),2) as total_revenue
from customer
group by subscription_status
order by total_revenue ,avg_spendings

-- 6. 5 products with highest percentage of purchases with discounts applied
SELECT TOP 5 item_purchased,
ROUND(SUM(CASE WHEN discount_applied = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS discount_rate
FROM customer
GROUP BY item_purchased
ORDER BY discount_rate DESC;

--7. Categorizing customers into New , returning and Loyal --
with customer_type as (
SELECT customer_id, previous_purchases,
CASE 
    WHEN previous_purchases = 1 THEN 'New'
    WHEN previous_purchases BETWEEN 2 AND 10 THEN 'Returning'
    ELSE 'Loyal'
    END AS customer_segment
FROM customer)

select customer_segment,count(*) AS "Number of Customers" 
from customer_type 
group by customer_segment;

--8. Top 3 products from each category 
WITH item_counts AS (
    SELECT category,
           item_purchased,
           COUNT(customer_id) AS total_orders,
           ROW_NUMBER() OVER (PARTITION BY category ORDER BY COUNT(customer_id) DESC) AS item_rank
    FROM customer
    GROUP BY category, item_purchased
)
SELECT item_rank,category, item_purchased, total_orders
FROM item_counts
WHERE item_rank <=3;

--9.  Are repeating customers also likely buy subscription 
SELECT subscription_status,
       COUNT(customer_id) AS repeat_buyers
FROM customer
WHERE previous_purchases > 5
GROUP BY subscription_status;
-- 10 revenue contribution of each age group 
SELECT 
    age_group,
    SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY age_group
ORDER BY total_revenue desc;