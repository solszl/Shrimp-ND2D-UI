package com.shrimp.nd2d.constant
{
	public class AssetType
	{
		/* ------------------ relationship of importer and asset------------------
		 * BITMAP 		-> BITMAP
		 * TEXTURE_UI 	-> UI_TEXTURE_VO, UI_TEXTURE_PACK, BITMAP
		 * JSON_UI 		-> OBJECT, (TEXTURE_UI)
		 */
		
		// for both
		public static const BITMAP:int				= 101;
		public static const TEXTURE:int				= 102;
		public static const OBJECT:int				= 201;
		public static const UI_TEXTURE_PACK:int		= 202;
		public static const UI_TEXTURE_VO:int		= 203;
		public static const TEXTURE_UI:int	 		= 302;
		public static const JSON_UI:int				= 303;
		public static const BINARY_UI:int			= 304;
		public static const XML:int			        = 501;
		public static const TEXTUREATLAS:int		= 502;
		public static const BYTEARRAY:int	    	= 503;
	}
}