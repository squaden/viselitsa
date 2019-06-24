class WordReader
  def read_from_args
    ARGV[0]
  end

  def read_from_file(file_name)
    if !File.exist?(file_name)
      return nil
    end

    file = File.new(file_name)
    lines = file.readlines
    file.close

    lines.sample.chomp
  end
end
