// Enums
Enum role {
  guest
  host
  admin
}

Enum booking_status {
  pending
  confirmed
  canceled
}

Enum payment_method {
  credit_card
  paypal
  stripe
}

// Tables
Table users {
  user_id uuid [pk]
  first_name varchar [not null]
  last_name varchar [not null]
  email varchar [not null, unique]
  password_hash varchar [not null]
  phone_number varchar
  role role [not null]
  created_at timestamp [default: `CURRENT_TIMESTAMP`]

  Indexes {
    email [unique]
  }
}

Table properties {
  property_id uuid [pk]
  host_id uuid [not null]
  name varchar [not null]
  description text [not null]
  location varchar [not null]
  price_per_night decimal [not null]
  created_at timestamp [default: `CURRENT_TIMESTAMP`]
  updated_at timestamp
}

Table bookings {
  booking_id uuid [pk]
  property_id uuid [not null]
  user_id uuid [not null]
  start_date date [not null]
  end_date date [not null]
  total_price decimal [not null]
  status booking_status [not null]
  created_at timestamp [default: `CURRENT_TIMESTAMP`]
}

Table payments {
  payment_id uuid [pk]
  booking_id uuid [not null]
  amount decimal [not null]
  payment_date timestamp [default: `CURRENT_TIMESTAMP`]
  payment_method payment_method [not null]
}

Table reviews {
  review_id uuid [pk]
  property_id uuid [not null]
  user_id uuid [not null]
  rating int [not null]
  comment text [not null]
  created_at timestamp [default: `CURRENT_TIMESTAMP`]
}

Table messages {
  message_id uuid [pk]
  sender_id uuid [not null]
  recipient_id uuid [not null]
  message_body text [not null]
  sent_at timestamp [default: `CURRENT_TIMESTAMP`]
}

// Relationships
Ref: properties.host_id > users.user_id
Ref: bookings.property_id > properties.property_id
Ref: bookings.user_id > users.user_id
Ref: payments.booking_id > bookings.booking_id
Ref: reviews.property_id > properties.property_id
Ref: reviews.user_id > users.user_id
Ref: messages.sender_id > users.user_id
Ref: messages.recipient_id > users.user_id
