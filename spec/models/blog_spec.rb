#encoding: utf-8
require 'spec_helper'

describe Blog do
  it "对博客进行数据验证" do
    expect(build(:blog)).to be_valid
  end

  it "标题不得为空" do
    expect(build(:blog, title: nil)).to have(1).errors_on(:title)
  end

  it "内容不得为空" do
    expect(build(:blog, artical: nil)).to have(1).errors_on(:artical)
  end
end
