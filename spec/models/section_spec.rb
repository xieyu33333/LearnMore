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
end
