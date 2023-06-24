namespace Hotel.Extension
{
	public static class FileExtension
	{
		public static bool CheckSize(this IFormFile file,int size)
		{
			return file.Length / 1024 > size;
		}
		public static bool CheckFile(this IFormFile file,string type)
		{
			return file.ContentType.Contains(type + "/");
		}
		public static async Task<string> SaveFile(this IFormFile file,string root,string mainfile)
		{
			string uniquefile = Guid.NewGuid().ToString() + "_" + file.FileName;
			string path = Path.Combine(root,"assets","img",mainfile, uniquefile);

			using FileStream stream = new FileStream(path, FileMode.Create);
			await file.CopyToAsync(stream);
			return uniquefile;
		} 

	}
}
