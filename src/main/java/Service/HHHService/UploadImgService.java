package Service.HHHService;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UploadImgService
{
	String originalFile = null;
	String originalFileExtension = null;
	String storedFileName = null;
	String filePath = null;
	String realPath = null;

	public String upLoadImg(MultipartFile mainPhoto,  HttpServletRequest request) throws IllegalStateException, IOException
	{
		filePath = "WEB-INF\\view\\HHHview\\doIMG\\";
		realPath = request.getServletContext().getRealPath(filePath);
		//System.out.println("리얼패스" + realPath);
		// realPath =
		// "D:\\Hk004\\Spring\\sp4-smrit\\src\\main\\webapp\\WEB-INF\\view\\UploadFile\\upload\\";
		
		originalFile = mainPhoto.getOriginalFilename();
		originalFileExtension = originalFile.substring(originalFile.lastIndexOf("."));
		storedFileName = UUID.randomUUID().toString().replace("-", "") + originalFileExtension;
		
		File file = new File(realPath + "\\" + storedFileName);
		mainPhoto.transferTo(file);
		
		return storedFileName;
	}

}
