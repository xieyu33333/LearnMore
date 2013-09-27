#encoding: utf-8
require 'spec_helper'

describe User do
  it "对用户进行数据验证" do
    expect(build(:user)).to be_valid
  end

  it "用户名必填" do
    expect(build(:user, :username=>nil)).to have(1).errors_on(:username)
  end

  it "邮箱不能重复" do
    User.create(username: "test_email",
       email: "xieyu33333@126.com",
       password: "1234567")
    expect(build(:user)).to have(1).errors_on(:email)
  end

  it "用户名不能重复" do
    User.create(username: "test",
           email: "xieyu@126.com",
           password: "1234567")
    expect(build(:user, :username=>"test")).to have(1).errors_on(:username)
  end
end
