using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

public class CategoryTreeCollection : IHierarchicalEnumerable
{
    private readonly IEnumerable<CategoryTree> _categories;
    private readonly IEnumerable<CategoryTree> _frame;

    private IEnumerable<CategoryTree> ListFirstLevel()
    {
        return _categories.Where(x => !x.FromID.HasValue);
    }

    public IHierarchyData GetHierarchyData(object enumeratedItem)
    {
        return new CategoryTreeData(_categories, (CategoryTree)enumeratedItem);
    }

    public System.Collections.IEnumerator GetEnumerator()
    {
        return _frame.GetEnumerator();
    }

    public CategoryTreeCollection(IEnumerable<CategoryTree> categories)
    {
        _categories = categories.ToArray().AsEnumerable();
        //_categories = categories;
        _frame = this.ListFirstLevel();
    }

    public CategoryTreeCollection(IEnumerable<CategoryTree> categories, IEnumerable<CategoryTree> frame)
    {
        _categories = categories;
        _frame = frame;
    }
}
