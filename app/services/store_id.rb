class StoreId
@@event_id = 0

  def store(event_id)
    @@event_id = event_id
  end

  def create(customer)
    Attendance.create(event_id: @@event_id, customer_id: customer)
  end

end