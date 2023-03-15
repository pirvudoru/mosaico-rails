module Mosaico
  class UploadedImage < Image
    class << self
      def backend
        Mosaico::Engine.config.image_backend
      end
    end

    def to_json
      {
        deleteType: 'DELETE',
        deleteUrl: url,
        name: file,
        originalName: file,
        size: filesize,
        thumbnailUrl: url,
        type: nil,
        url: url
      }
    end

    def url
      self.class.backend.url_to(file)
    end
  end
end
