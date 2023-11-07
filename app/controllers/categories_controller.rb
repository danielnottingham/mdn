# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    result = Categories::List.result(scope: authorized_categories_scope)

    render Categories::IndexPage.new(categories: result.categories, current_user: current_user)
  end

  def new
    render Categories::NewPage.new(category: Category.new, current_user: current_user)
  end

  def edit
    authorize! category

    render Categories::EditPage.new(category: category, current_user: current_user)
  end

  def create
    result = Categories::Create.result(attributes: category_params)

    if result.success?
      redirect_to categories_path, success: t(".success")
    else
      render Categories::NewPage.new(category: result.category, current_user: current_user),
        status: :unprocessable_entity
    end
  end

  def update
    authorize! category
    result = Categories::Update.result(id: category.id, attributes: category_params)

    if result.success?
      redirect_to categories_path, success: t(".success")
    else
      render Categories::EditPage.new(category: result.category, current_user: current_user),
        status: :unprocessable_entity
    end
  end

  def destroy
    authorize! category
    result = Categories::Destroy.result(id: params[:id])

    if result.success?
      redirect_to categories_path, success: t(".success")
    else
      redirect_to edit_category_path(result.category), error: t(".error")
    end
  end

  private

  def authorized_categories_scope
    scope = authorized_scope(Category.all, with: CategoryPolicy)
    Categories::List.result(scope: scope).categories
  end

  def category
    @category ||= Categories::Find.result(id: params[:id]).category
  end

  def category_params
    params.require(:category).permit(:title, :color).to_h.merge(user_id: current_user.id)
  end
end
