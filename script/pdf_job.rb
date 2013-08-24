#!/usr/bin/env ruby
ENV['RAILS_ENV'] = ARGV[0] || 'production'
require File.dirname(__FILE__) + '/../config/environment'

# referre to http://sublog.subimage.com/2007/05/29/html-css-to-pdf-using-ruby-on-rails

class Prince
  attr_accessor :exe_path, :style_sheets
  
  def initialize
    @exe_path = 'prince'
    @style_sheets = ''
  end
  
  def add_style_sheets(*sheets)
    for sheet in sheets do
      @style_sheets << " -s #{RAILS_ROOT}/public/stylesheets/#{sheet}.css"
    end
  end
  
  def exe_path
    @exe_path << " --input=html"
    @exe_path << @style_sheets
    return @exe_path
  end
  
  def html_to_pdf(file)
    path = "tidy -f #{file}.tidy.log -utf8 --tidy-mark false #{file}.html|"
    path << " sed 's/font-family:[^;]*;//' | "  # 去掉字体设置，防止乱码
    path << self.exe_path
    path << " --silent --log=#{file}.prince.log - -o - |"
    # 下面两行去除 prince logo 信息
    path << "sed '/Rect \\[555.2756 801.8898 580.2756 826.8898\\]/{N;N;N;N;N;N;N;N;N;N;s/.*/\\/Rect [-100 0 0 0]/}' |"
    path << "sed 's/555.2756 801.8898 580.2756 826.8898/-100 0 0 0/' |"
    path << "sed '/Producer/{s/.*/<</}' > #{file}.pdf"
    puts path
    `#{path}`
  end
end

PdfJob.find_all_by_completed_at(nil).each { |job|
  job.generate_html
  prince = Prince.new
  prince.add_style_sheets("pdf", "pdf_#{job.pdf_type}")
  prince.html_to_pdf("#{job.folder}#{job.file_name}")
  job.complete!
}