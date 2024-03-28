module RedmineIssuesTree
  module IssuesHelperPatch

    def self.included(base)
      base.class_eval do
        def link_to_tree_view(project = @project)
          if project.present?
            content_tag('span', 
                        link_to( l(:tree_view, scope: 'issues_tree'), '#',
                                class: 'icon icon-orange-tree issues-tree-view-link',
                                data: {link_to_tree_view: redirect_with_params_project_issues_trees_path(project_id: project)}),
                        class: 'ex-menu',
                        style: 'display:inline-block;float:left;padding-right:20px;')
        else
            content_tag('span', 
                        link_to( l(:tree_view, scope: 'issues_tree'), '#',
                                class: 'icon icon-orange-tree issues-tree-view-link',
                                data: {link_to_tree_view: redirect_with_params_issues_trees_path}),
                        class: 'ex-menu',
                        style: 'display:inline-block;float:left;padding-right:20px;')
          end
        end
      end
    end
  end
end

unless IssuesHelper.included_modules.include?(RedmineIssuesTree::IssuesHelperPatch)
  IssuesHelper.send(:include, RedmineIssuesTree::IssuesHelperPatch)
end
