package com.shrimp.nd2d.assets
{
	import flash.utils.Dictionary;
	
	/**
	 * 
	 * @author Sol
	 * 
	 */
	internal class AssetPool 
	{
		internal static function get _pool():Dictionary
		{
			return s_pool;
		}
		
		public static var s_pool:Dictionary = new Dictionary();
	}
}