Table users {
  user_id uuid [pk, unique, note: "Primary Key"]
  first_name varchar [not null]
  last_name varchar [not null]
  email varchar [not null, unique]
  password_hash varchar [not null]
  phone_number varchar
  role varchar [not null, note: "ENUM: guest, host, admin"]
  created_at timestamp [default: `CURRENT_TIMESTAMP`]
}

Table properties {
  property_id uuid [pk, unique]
  host_id uuid [ref: > users.user_id]
  name varchar [not null]
  description text [not null]
  location varchar [not null]
  pricepernight decimal [not null]
  created_at timestamp [default: `CURRENT_TIMESTAMP`]
  updated_at timestamp [note: "Updates on modification"]
}

Table bookings {
  booking_id uuid [pk, unique]
  property_id uuid [ref: > properties.property_id]
  user_id uuid [ref: > users.user_id]
  start_date date [not null]
  end_date date [not null]
  total_price decimal [not null]
  status varchar [not null, note: "ENUM: pending, confirmed, canceled"]
  created_at timestamp [default: `CURRENT_TIMESTAMP`]
}

Table payments {
  payment_id uuid [pk, unique]
  booking_id uuid [ref: > bookings.booking_id]
  amount decimal [not null]
  payment_date timestamp [default: `CURRENT_TIMESTAMP`]
  payment_method varchar [not null, note: "ENUM: credit_card, paypal, stripe"]
}

Table reviews {
  review_id uuid [pk, unique]
  property_id uuid [ref: > properties.property_id]
  user_id uuid [ref: > users.user_id]
  rating int [not null, note: "CHECK: rating between 1 and 5"]
  comment text [not null]
  created_at timestamp [default: `CURRENT_TIMESTAMP`]
}

Table messages {
  message_id uuid [pk, unique]
  sender_id uuid [ref: > users.user_id]
  recipient_id uuid [ref: > users.user_id]
  message_body text [not null]
  sent_at timestamp [default: `CURRENT_TIMESTAMP`]
}
