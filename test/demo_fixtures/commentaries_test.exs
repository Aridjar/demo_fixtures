defmodule DemoFixtures.CommentariesTest do
  use DemoFixtures.DataCase
  use DemoFixtures.Fixtures, [:post, :commentary]

  describe "commentaries" do

    test "list_commentaries/0 returns all commentaries" do
      commentary = commentary_fixture()
      assert Commentaries.list_commentaries() == [commentary]
    end

    test "get_commentary!/1 returns the commentary with given id" do
      commentary = commentary_fixture()
      assert Commentaries.get_commentary!(commentary.id) == commentary
    end

    test "create_commentary/1 with valid data creates a commentary" do
      assert {:ok, %Commentary{} = commentary} = Commentaries.create_commentary(@valid_attrs)
      assert commentary.content == "some content"
    end

    test "create_commentary/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Commentaries.create_commentary(@invalid_attrs)
    end

    test "update_commentary/2 with valid data updates the commentary" do
      commentary = commentary_fixture()
      assert {:ok, %Commentary{} = commentary} = Commentaries.update_commentary(commentary, @update_attrs)
      assert commentary.content == "some updated content"
    end

    test "update_commentary/2 with invalid data returns error changeset" do
      commentary = commentary_fixture()
      assert {:error, %Ecto.Changeset{}} = Commentaries.update_commentary(commentary, @invalid_attrs)
      assert commentary == Commentaries.get_commentary!(commentary.id)
    end

    test "delete_commentary/1 deletes the commentary" do
      commentary = commentary_fixture()
      assert {:ok, %Commentary{}} = Commentaries.delete_commentary(commentary)
      assert_raise Ecto.NoResultsError, fn -> Commentaries.get_commentary!(commentary.id) end
    end

    test "change_commentary/1 returns a commentary changeset" do
      commentary = commentary_fixture()
      assert %Ecto.Changeset{} = Commentaries.change_commentary(commentary)
    end
  end
end
