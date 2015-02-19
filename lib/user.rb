class User
@@all_users = []

  def initialize(user_name)
    @user_name = user_name
    @collection = []
    @id = set_id
  end

  def save
    @@all_users.push(self)
  end

  def self.all
    @@all_users
  end

  def self.clear
    @@all_users = []
  end

  def user_name
    @user_name
  end

  def set_id
    @@all_users.length + 1
  end

  def id
    @id
  end

  def collection
    @collection
  end

  def add_cd(cd)
    @collection.push(cd)
  end

  def self.find(user_id_number)
    found_user = nil
    @@all_users.each do |user|
      if user.id == user_id_number.to_i
        found_user = user
      end
    end
    found_user
  end

end
