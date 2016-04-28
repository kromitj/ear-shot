module SongsHelper
  def remote_upload(song)
    S3_BUCKET.objects.create(song, @file_data.tempfile)
  end

  def last_5(user_id)
    Listen.where(user_id: user_id).last(10)
  end
end
