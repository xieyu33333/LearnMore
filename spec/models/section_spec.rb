#encoding: utf-8
require 'spec_helper'

describe Section do
  it "对版块提交信息进行验证" do
    expect(build(:section)).to be_valid
  end

  it "版块标题必填" do
    expect(build(:section, :name=>nil)).to have(1).errors_on(:name)
  end

  it "版块描述必填" do
    expect(build(:section, :description=>nil)).to have(1).errors_on(:description)
  end

  it "pass?方法可用" do
    expect(build(:section, :status=>0).pass?).to be_true
  end

  it "add_users(users)方法可用" do
    @user = User.create(username: "xieyu",
         email: "xieyu@126.com",
         password: "1234567")
    @section = build(:section)
    @section.add_users(["xieyu"])
    expect(@section.users[0].username).to eq "xieyu"
  end
end
