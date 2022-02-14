module ApplicationHelper
  def default_meta_tags
    {
      site: '真のナポリピッツァ部',
      title: '「真のナポリピッツァ協会」認定店を簡単に探せるサービス',
      reverse: true,
      separator: '|',
      description: '真のナポリピッツァ部は、「真のナポリピッツァ協会」認定店のみを簡単に探せるWebサービスです。お店を探してナポリピッツァを食べに行こう。',
      keywords: 'ナポリピッツァ',
      canonical: request.original_url,
      noindex: !Rails.env.production?,
      icon: [
        { href: image_url('favicon.png') },
        { href: image_url('touchicon.png'), rel: 'apple-touch-icon', sizes: '180x180',
          type: 'image/jpg' }
      ],
      og: {
        site_name: '真のナポリピッツァ部',
        title: '「真のナポリピッツァ協会」認定店を簡単に探せるサービス',
        description: '真のナポリピッツァ部は、「真のナポリピッツァ協会」認定店のみを簡単に探せるWebサービス。お店を探してナポリピッツァを食べに行こう。',
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@ohno_hope3',
        image: image_url('ogp.png')
      }
    }
  end

      # 渡されたユーザーがカレントユーザーであればtrueを返す
  def current_user?(user)
    user && user == current_user
  end
end
