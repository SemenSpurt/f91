defmodule F91.EctoTest do
  use F91.DataCase

  alias F91.Ecto

  describe "pages" do
    alias F91.Ecto.Page

    import F91.EctoFixtures

    @invalid_attrs %{title: nil, bg_color: nil, bg_transparency: nil, bg_state: nil}

    test "list_pages/0 returns all pages" do
      page = page_fixture()
      assert Ecto.list_pages() == [page]
    end

    test "get_page!/1 returns the page with given id" do
      page = page_fixture()
      assert Ecto.get_page!(page.id) == page
    end

    test "create_page/1 with valid data creates a page" do
      valid_attrs = %{title: "some title", bg_color: "some bg_color", bg_transparency: 120.5, bg_state: true}

      assert {:ok, %Page{} = page} = Ecto.create_page(valid_attrs)
      assert page.title == "some title"
      assert page.bg_color == "some bg_color"
      assert page.bg_transparency == 120.5
      assert page.bg_state == true
    end

    test "create_page/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ecto.create_page(@invalid_attrs)
    end

    test "update_page/2 with valid data updates the page" do
      page = page_fixture()
      update_attrs = %{title: "some updated title", bg_color: "some updated bg_color", bg_transparency: 456.7, bg_state: false}

      assert {:ok, %Page{} = page} = Ecto.update_page(page, update_attrs)
      assert page.title == "some updated title"
      assert page.bg_color == "some updated bg_color"
      assert page.bg_transparency == 456.7
      assert page.bg_state == false
    end

    test "update_page/2 with invalid data returns error changeset" do
      page = page_fixture()
      assert {:error, %Ecto.Changeset{}} = Ecto.update_page(page, @invalid_attrs)
      assert page == Ecto.get_page!(page.id)
    end

    test "delete_page/1 deletes the page" do
      page = page_fixture()
      assert {:ok, %Page{}} = Ecto.delete_page(page)
      assert_raise Ecto.NoResultsError, fn -> Ecto.get_page!(page.id) end
    end

    test "change_page/1 returns a page changeset" do
      page = page_fixture()
      assert %Ecto.Changeset{} = Ecto.change_page(page)
    end
  end

  describe "projects" do
    alias F91.Ecto.Project

    import F91.EctoFixtures

    @invalid_attrs %{title: nil}

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Ecto.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Ecto.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      valid_attrs = %{title: "some title"}

      assert {:ok, %Project{} = project} = Ecto.create_project(valid_attrs)
      assert project.title == "some title"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ecto.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      update_attrs = %{title: "some updated title"}

      assert {:ok, %Project{} = project} = Ecto.update_project(project, update_attrs)
      assert project.title == "some updated title"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Ecto.update_project(project, @invalid_attrs)
      assert project == Ecto.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Ecto.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Ecto.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Ecto.change_project(project)
    end
  end

  describe "directories" do
    alias F91.Ecto.Directory

    import F91.EctoFixtures

    @invalid_attrs %{title: nil}

    test "list_directories/0 returns all directories" do
      directory = directory_fixture()
      assert Ecto.list_directories() == [directory]
    end

    test "get_directory!/1 returns the directory with given id" do
      directory = directory_fixture()
      assert Ecto.get_directory!(directory.id) == directory
    end

    test "create_directory/1 with valid data creates a directory" do
      valid_attrs = %{title: "some title"}

      assert {:ok, %Directory{} = directory} = Ecto.create_directory(valid_attrs)
      assert directory.title == "some title"
    end

    test "create_directory/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ecto.create_directory(@invalid_attrs)
    end

    test "update_directory/2 with valid data updates the directory" do
      directory = directory_fixture()
      update_attrs = %{title: "some updated title"}

      assert {:ok, %Directory{} = directory} = Ecto.update_directory(directory, update_attrs)
      assert directory.title == "some updated title"
    end

    test "update_directory/2 with invalid data returns error changeset" do
      directory = directory_fixture()
      assert {:error, %Ecto.Changeset{}} = Ecto.update_directory(directory, @invalid_attrs)
      assert directory == Ecto.get_directory!(directory.id)
    end

    test "delete_directory/1 deletes the directory" do
      directory = directory_fixture()
      assert {:ok, %Directory{}} = Ecto.delete_directory(directory)
      assert_raise Ecto.NoResultsError, fn -> Ecto.get_directory!(directory.id) end
    end

    test "change_directory/1 returns a directory changeset" do
      directory = directory_fixture()
      assert %Ecto.Changeset{} = Ecto.change_directory(directory)
    end
  end
end
