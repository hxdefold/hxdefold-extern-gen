package util;

import types.ExternEnum;
using StringTools;


class Util
{
    public static function capitalize(s: String): String
    {
        return s.charAt(0).toUpperCase() + s.substr(1).toLowerCase();
    }


    public static function getEnumMatchingDescription(description: String, enums: Array<ExternEnum>): ExternEnum
    {
        for (enm in enums)
        {
            for (value in enm.values)
            {
                if (description.contains(value.value))
                {
                    return enm;
                }
            }
        }
        return null;
    }
}
