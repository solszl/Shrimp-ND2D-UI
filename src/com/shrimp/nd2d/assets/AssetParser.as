package com.shrimp.nd2d.assets
{
	/**
	 * 
	 * @author Sol
	 * 
	 */
	public class AssetParser 
	{
		public function AssetParser() 
		{
		}
		
		internal function _destroy():void
		{
			dispose();
			
			m_info = null;
			m_callback = null;
		}
		
		internal function _parse(p_info:AssetInfo, p_callback:Function):void
		{
			m_info = p_info;
			m_callback = p_callback;
			
			parseData();
		}
		
		protected function dispose():void
		{
		}
		
		protected function parseData():void
		{
		}
		
		protected final function parseDone(p_data:IAssetData):void
		{
			m_callback(p_data);
			m_callback = null;
		}
		
		protected function get info():AssetInfo
		{
			return m_info;
		}
		
		private var m_info:AssetInfo = null;
		private var m_callback:Function = null;
		
		public static function support(p_type:int):Boolean
		{
			return false;
		}
		
		public static function enableParser(p_parser:Class):void
		{
			s_parsers.push(p_parser);
		}
		
		public static function enableParsers(p_parsers:Vector.<Class>):void
		{
			for (var i:int = 0; i < p_parsers.length; ++i)
			{
				enableParser(p_parsers[i]);
			}
		}
		
		internal static function get _parsers():Vector.<Class>
		{
			return s_parsers;
		}
		
		private static var s_parsers:Vector.<Class> = new Vector.<Class>;		
	}
}