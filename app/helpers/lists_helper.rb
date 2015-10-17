module ListsHelper
	def list_privacy_image
		if @list.opened
      image_tag('list/unlocked.png', title: "Pública")
    else
      image_tag('list/locked.png', title: "Privada")
    end
	end
end