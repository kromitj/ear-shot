module SongsHelper
  def remote_upload(song)
    S3_BUCKET.objects.create(song, @file_data.tempfile)
  end
end
