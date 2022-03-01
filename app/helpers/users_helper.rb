module UsersHelper
  def user_status(user)
    visited_count = user.visited_shops.count
    case visited_count
    when 0..2
        user.status = 0
    when 3..6
        user.status = 1
    when 7..12
        user.status = 2
    when 13..19
        user.status = 3
    when 20..29
        user.status = 4
    when 30..39
        user.status = 5
    else
        user.status = 6
    end
    user.status
  end
end
