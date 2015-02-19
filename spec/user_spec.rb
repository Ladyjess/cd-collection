require 'cd_collection'
require 'user'
require 'rspec'

describe User do
  before do
    User.clear
  end

  describe "#save" do
    it "will create a new user" do
      test_user = User.new("Sasha")
      expect(test_user.save).to eq [test_user]
    end
  end

  describe ".all" do
    it "will be empty at first" do
      expect(User.all).to eq []
    end
  end

  describe ".clear" do
    it "clears out all users" do
      test_user = User.new("Sasha")
      test_user.save
      expect(User.clear).to eq []
    end
  end

  describe "#user_name" do
    it "returns a user's name" do
      test_user = User.new("Sasha")
      test_user.save
      expect(test_user.user_name).to eq "Sasha"
    end
  end

  describe "#id" do
    it "returns a user's unique id" do
      test_user = User.new("Sasha")
      test_user.save
      expect(test_user.id).to eq 1
    end
  end

  describe "#set_id" do
    it "sets a user's id" do
      test_user = User.new("Sasha")
      test_user.save
      expect(test_user.set_id).to eq 2
    end
  end

  describe "#add_cd" do
    it "lets a user add a cd to their collection" do
      test_user = User.new("Sasha")
      test_cd = CD.new("Mariah Carey", "Fantasy")
      test_user.add_cd(test_cd)
      expect(test_user.collection).to eq [test_cd]
    end
  end

  describe ".find" do
    it "returns a user's cd collection" do
      test_user = User.new("Sasha")
      test_user.save
      test_user2 = User.new("Jess")
      test_user2.save
      expect(User.find(test_user.id)).to eq (test_user)
    end
  end

end
