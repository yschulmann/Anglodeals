using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

public class CityTreeCollection : IHierarchicalEnumerable
{
    private readonly IEnumerable<CityTree> _categories;
    private readonly IEnumerable<CityTree> _frame;

    private IEnumerable<CityTree> ListFirstLevel()
    {
        return _categories.Where(x => !x.FromID.HasValue);
    }

    public IHierarchyData GetHierarchyData(object enumeratedItem)
    {
        return new CityTreeData(_categories, (CityTree)enumeratedItem);
    }

    public System.Collections.IEnumerator GetEnumerator()
    {
        return _frame.GetEnumerator();
    }

    public CityTreeCollection(IEnumerable<CityTree> categories)
    {
        _categories = categories.ToArray().AsEnumerable();
        //_categories = categories;
        _frame = this.ListFirstLevel();
    }

    public CityTreeCollection(IEnumerable<CityTree> categories, IEnumerable<CityTree> frame)
    {
        _categories = categories;
        _frame = frame;
    }
}
