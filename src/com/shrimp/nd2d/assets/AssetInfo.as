package com.shrimp.nd2d.assets
{
	/**
	 * 
	 * @author Sol
	 * 
	 */	
	public class AssetInfo 
	{
		public function AssetInfo(p_asset:Asset) 
		{
			m_asset = p_asset;
		}
		
		public function get url():String
		{
			return m_asset.url;
		}
		
		public function get type():int
		{
			return m_asset.type;
		}
		
		public function get level():int
		{
			return m_asset.level;
		}
		
		public function get lifecycle():int
		{
			return m_asset.lifecycle;
		}
		
		private var m_asset:Asset = null;
	}
}