package com.shrimp.nd2d.assets
{
	/**
	 * 
	 * @author Sol
	 * 
	 */
	public class AssetNullData implements IAssetData
	{
		public function AssetNullData() 
		{
		}
		
		public function get data():*
		{
			return null;
		}
		
		public function destroy():void
		{
		}
	}
}