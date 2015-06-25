require 'zlib'
require 'aws'

module S3Gzip
  class Writer
    attr_reader :bucket
    attr_reader :filename

    def initialize(bucket, filename)

      @bucket = bucket
      @filename = filename

      s3 = AWS::S3.new
      bucket = s3.buckets[bucket]
      s3_object = bucket.objects[filename]
      @io = S3io.open(s3_object, 'w')
      @gzip_writer = Zlib::GzipWriter.new(@io)
    end

    def closed?
      not @gzip_writer.nil? and @gzip_writer.closed?
    end

    def write(*args)
      @gzip_writer.write(*args)
    end

    def close
      unless self.closed?
        @gzip_writer.close
        @io=nil
      end
    end

    def self.open(*args)
      writer = new(*args)
      return writer unless block_given?
      yield writer
    ensure
      writer.close if writer && block_given?
    end

    def self.write(bucket, filename, value)
      writer = new(bucket, filename)
      writer.write(value)
      writer.close
    end
  end
end
