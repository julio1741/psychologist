require "test_helper"

class ReservationsTest < ActionDispatch::IntegrationTest
  fixtures :hospitals
  fixtures :doctors
  fixtures :work_days
  fixtures :block_times
  fixtures :users

  test "login and browse rervations" do
    get "/login"
    login(:maria, 'maria')
    follow_redirect!

    get "/reservations"
    assert_select "h2", "Reservations"
    assert_equal 200, status

    get "/reservations/new"
    assert_select "h1", "New reservation"
    assert_equal 200, status

    assert_no_difference 'Reservation.count' do
      post "/reservations", params: { reservation: { firstname: "julio", rut: "25176838-2" } }
    end

    assert_difference 'Reservation.count' do
      make_reservation({
                         reservation: {
                           firstname: "Julio",
                           rut: "25176838-2",
                           email: users(:julio).email,
                           doctor_id: doctors(:ricardo).id,
                           work_day_id: work_days(:monday).id,
                           day: '2022-07-25',
                           phone: '95612365478',
                           block_time_id: block_times(:block_time1).id,
                           user_id: users(:julio).id
                         }
                       })
    end
    follow_redirect!
    assert_equal "/reservations", path

    assert_no_difference 'Reservation.count' do
      # making same reservation
      make_reservation({
                         reservation: {
                           firstname: "Julio",
                           rut: "25176838-2",
                           email: users(:julio).email,
                           doctor_id: doctors(:ricardo).id,
                           work_day_id: work_days(:monday).id,
                           day: '2022-07-25',
                           phone: '95612365478',
                           block_time_id: block_times(:block_time1).id,
                           user_id: users(:julio).id
                         }
                       })
    end
    assert_equal 422, status
  end

  private

  def login(user, password)
    user = users(user)
    post "/login", params: { user: { username: user.username, password: password } }
  end

  def make_reservation params
    post "/reservations", params: params
  end
end
