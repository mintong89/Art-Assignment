using System.Configuration;
namespace LoozMembershipConfig
{    
    //Extend the ConfigurationSection class.  Your class name should match your section name and be postfixed with "Section".
    public class LoozMemebershipSection : ConfigurationSection
    {
        //Decorate the property with the tag for your collection.
        [ConfigurationProperty("membership")]
        public LoozMembershipConfigCollection membership
        {
            get { return (LoozMembershipConfigCollection)this["membership"]; }
        }
    }
    //Extend the ConfigurationElementCollection class.
    //Decorate the class with the class that represents a single element in the collection.
    [ConfigurationCollection(typeof(MembershipElement))]
    public class LoozMembershipConfigCollection : ConfigurationElementCollection
    {
        public MembershipElement this[int index]
        {
            get { return (MembershipElement)BaseGet(index); }
            set
            {
                if (BaseGet(index) != null)
                    BaseRemoveAt(index);
                BaseAdd(index, value);
            }
        }
        protected override ConfigurationElement CreateNewElement()
        {
            return new MembershipElement();
        }
        protected override object GetElementKey(ConfigurationElement element)
        {
            return ((MembershipElement)element).Path;
        }
    }
    //Extend the ConfigurationElement class.  This class represents a single element in the collection.
    //Create a property for each xml attribute in your element.
    //Decorate each property with the ConfigurationProperty decorator.  See MSDN for all available options.
    public class MembershipElement : ConfigurationElement
    {
        [ConfigurationProperty("path", IsRequired = true)]
        public string Path
        {
            get { return (string)this["path"]; }
            set { this["path"] = value; }
        }

        [ConfigurationProperty("requiredRoles", IsRequired = true)]
        public string RequiredRole
        {
            get { return (string)this["requiredRoles"]; }
            set { this["requiredRoles"] = value; }
        }
    }
}