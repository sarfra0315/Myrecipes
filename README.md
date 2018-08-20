# README
prefix             verb      url pattern              Controller#action

recipes            GET       /recipes                  recipes#index
new_recipe         GET       /recipes/new               recipes#new [whenever use new,its disp a form]
                   POST      /recipes                  recipes#create [submit the infor from form]
edit_recipe        POST      /recipes/:id/edit          recipes#edit   [here id is dynamic element]
                   PATCH     /recipes/:id/update        recipes#update [submitted the edited form info]
recipe             GET       /recipes/:id/show          recipes#show   [display a particular info]
                   DELETE    /recipes/:id               recipes#destroy [delete an info]                              