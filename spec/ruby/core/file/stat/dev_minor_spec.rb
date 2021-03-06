require_relative '../../../spec_helper'

describe "File::Stat#dev_minor" do
  before :each do
    @name = tmp("file.txt")
    touch(@name)
  end
  after :each do
    rm_r @name
  end

  ruby_version_is "2.4" do
    platform_is_not :windows do
      it "returns the minor part of File::Stat#dev" do
        File.stat(@name).dev_minor.should be_kind_of(Integer)
      end
    end
  end

  platform_is :windows do
    it "returns nil" do
      File.stat(@name).dev_minor.should be_nil
    end
  end
end
