package com.shrimp.nd2d.assets
{
	import flash.utils.Dictionary;

	/**
	 *
	 * @author Sol
	 *
	 */
	public class AssetVisitor
	{
		public function AssetVisitor()
		{
		}

		public function destroy():void
		{
			for (var l_key:Object in m_refs)
			{
				var l_asset:Asset=Asset(l_key);
				var l_ref:int=m_refs[l_asset];
				while (l_ref > 0)
				{
					l_asset.release();
					--l_ref;
				}
			}
			m_refs=null;
		}

		public function retain(p_url:String, p_type:int):*
		{
			var l_asset:Asset=AssetPool._pool[Asset.assetId(p_url, p_type)];
			if (l_asset)
			{
				l_asset.retain();
				if (null == m_refs[l_asset])
				{
					m_refs[l_asset]=1;
				}
				else
				{
					m_refs[l_asset]+=1;
				}
				return l_asset.data;
			}
			else
			{
				return null;
			}
		}

		public function release(p_url:String, p_type:int):void
		{
			var l_asset:Asset=AssetPool._pool[Asset.assetId(p_url, p_type)];
			if (null != m_refs[l_asset])
			{
				l_asset.release();
				m_refs[l_asset]-=1;
			}
		}

		private var m_refs:Dictionary=new Dictionary();

		public static function has(p_url:String, p_type:int):Boolean
		{
			var l_asset:Asset=AssetPool._pool[Asset.assetId(p_url, p_type)];
			return (null != l_asset);
		}
	}
}
