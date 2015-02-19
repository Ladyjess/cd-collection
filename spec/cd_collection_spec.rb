require 'cd_collection'
require 'rspec'
require 'pry'

describe CD do
  before do
  CD.clear
  end

  describe '#save' do
    it 'will allow user to create a cd' do
      test_cd = CD.new("Michal Jackson", "Thriller")
      expect(test_cd.save).to eq [test_cd]
    end
  end

  describe '.all' do
    it 'will list all CDs' do
      expect(CD.all).to eq []
    end
  end

  describe '.clear' do
    it 'will clear all cds' do
       CD.new("Tina Turner", "Ike & Tina Live").save
       CD.clear
      expect(CD.all).to eq []
    end
  end

  describe '#artist' do
    it 'will give artist name' do
      test_cd = CD.new('a artist', 'a title')
      test_cd.save
      expect(test_cd.artist).to eq "a artist"
    end
  end

  describe '#title' do
    it 'will give title' do
      test_cd = CD.new('a artist', 'a title')
      test_cd.save
      expect(test_cd.title).to eq "a title"
    end
  end

  describe '.find_by_artist' do
    it "will find a cd by artist name" do
      test_cd = CD.new('a artist', 'a title')
      test_cd.save
      test_cd2 = CD.new("The Beatles", "The White Album")
      test_cd2.save
      expect(CD.find_by_artist('a artist')).to eq (test_cd)
    end
  end

  describe '#id' do
    it 'will return id of the CD' do
      test_cd = CD.new("Janice", "My song")
      test_cd.save
      expect(test_cd.id).to eq 1
    end
  end
end
