using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

public class CityTreeData : IHierarchyData
{
    private readonly CityTree _current;
    private readonly IEnumerable<CityTree> _categories;

    public CityTreeData(IEnumerable<CityTree> categories, CityTree currentCategory)
    {
        _categories = categories;
        _current = currentCategory;
    }

    public IHierarchicalEnumerable GetChildren()
    {
        return new CityTreeCollection(_categories, _categories.Where(x => x.FromID == _current.ID));
    }

    public IHierarchyData GetParent()
    {
        CityTree parent = _categories.Where(x => x.ID == _current.FromID).SingleOrDefault();
        return (parent != null ? new CityTreeData(_categories, parent) : null);
    }

    public bool HasChildren
    {
        get { return _categories.Any(x => x.FromID == _current.ID); }
    }

    public object Item
    {
        get { return _current; }
    }

    public string Path
    {
        get
        {
            IHierarchyData parent = this.GetParent();
            if (parent != null)
            {
                return parent.Path + "/" + _current.ID.ToString();
            }
            else
            {
                return _current.ID.ToString();
            }
        }
    }

    public string Type
    {
        get { return _current.GetType().ToString(); }
    }
}
