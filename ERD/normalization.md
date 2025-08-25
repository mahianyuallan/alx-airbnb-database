# AirBnB Database Normalization

## Objective
Apply normalization principles to ensure the database is in **Third Normal Form (3NF)**, eliminating redundancies and ensuring data integrity.

---

## Step 0: Original Schema Overview
Entities in the database:
- **User**
- **Property**
- **Booking**
- **Payment**
- **Review**
- **Message**

Each entity has attributes defined in the database specification, with primary keys (PKs) and foreign keys (FKs) linking related tables.

---

## Step 1: First Normal Form (1NF)
**1NF Rules:**
- Eliminate repeating groups.
- Ensure each field contains atomic values.

**Analysis:**
- All attributes are atomic (e.g., no arrays in `phone_number` or `location`).
- No multi-valued fields are present.

**Conclusion:** Database is in **1NF**.

---

## Step 2: Second Normal Form (2NF)
**2NF Rules:**
- Already in 1NF.
- Remove partial dependencies: all non-key attributes must depend on the whole primary key.

**Analysis:**
- All tables have single-column primary keys (UUIDs).
- No attributes depend on part of a composite key (no composite PKs used).

**Conclusion:** Database is in **2NF**.

---

## Step 3: Third Normal Form (3NF)
**3NF Rules:**
- Already in 2NF.
- Remove transitive dependencies: non-key attributes should not depend on other non-key attributes.

**Analysis of Each Table:**
1. **User** – All attributes depend solely on `user_id`. ✅  
2. **Property** – All attributes depend solely on `property_id`. ✅  
3. **Booking** – All attributes depend solely on `booking_id`. ✅  
4. **Payment** – All attributes depend solely on `payment_id`. ✅  
5. **Review** – All attributes depend solely on `review_id`. ✅  
6. **Message** – All attributes depend solely on `message_id`. ✅  

**Conclusion:** No transitive dependencies exist. Database is in **3NF**.

---

## Step 4: Optional Recommendations
1. **Role Table:**  
   - Create a `Role` table: `{role_id, role_name}`  
   - Replace ENUM `role` in `User` with `role_id` FK for flexibility.

2. **PaymentMethod Table:**  
   - Create a `PaymentMethod` table: `{method_id, method_name}`  
   - Replace ENUM `payment_method` in `Payment` with `method_id` FK.

3. **Unique Reviews:**  
   - Add a unique constraint `(user_id, property_id)` in `Review` to prevent duplicate reviews.

---

## Step 5: Summary of Normalization

| Normal Form | Result |
|------------|--------|
| 1NF        | ✅ All attributes are atomic |
| 2NF        | ✅ No partial dependencies |
| 3NF        | ✅ No transitive dependencies |

**Final Note:**  
The schema is well-structured, adheres to 3NF, and minimizes redundancy. Optional FK tables for roles and payment methods improve flexibility and maintainability.
