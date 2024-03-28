module IssuesTreesHelper
  def link_to_plain_view
    content_tag('span', 
              link_to( l(:back_to_plain_list, scope: 'issues_tree'),
                    {controller: :issues,
                    skip_issues_tree_redirect: true},
                    class: 'icon icon-plane-list'),
              class: 'ex-menu',
              style: 'display:inline-block;float:left;padding-right:20px;')

  end
end
