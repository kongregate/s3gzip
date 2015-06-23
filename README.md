s3gzip
======

Read and write gziped content in S3 without hitting disk.

## Example

```ruby
require 's3gzip'

bucket='MY_BUCKET'
filename='a/folder/with/filename.gz'

S3Gzip::Writer.open(bucket, filename) do |writer|
  writer.write 'some content, gzipped, then stored in s3.'
end

result = S3Gzip::Reader.read(bucket, filename)

puts result
# Output:
# some content, gzipped, then stored in s3.
```

### Methods

You can use `S3Gzip::Writer` in a variety of ways from a one-liner to many-liner. These three examples do the same thing:

```
require 's3gzip'

bucket = 'MY_BUCKET'
filename = 'a/folder/with/filename.gz'
content = 'some content, gzipped, then stored in s3.'

writer = S3Gzip::Writer.new(bucket, filename)
writer.write content
writer.close_and_send

S3Gzip::Writer.open(bucket, filename) do |writer|
  writer.write content
end

S3Gzip::Writer.write(bucket, filename, content)
``` 

When using the first method, `close_and_send` must be called. This is done automatically when using `open` or `write` class methods. 

Also, please note that every time you write to the file on S3, it will overwrite the previous value. This is generally true with S3, but can be a bit confusing given S3's eventual consistency model. Read more about that in the [AWS S3 FAQ](http://aws.amazon.com/s3/faqs/).


## Requirements/Dependencies

* [aws-s3](https://github.com/marcel/aws-s3) (0.6.3ish)

## Copyright

Copyright © 2014 Troy Howard. See LICENSE for details.
