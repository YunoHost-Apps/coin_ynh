from django_auth_ldap.config import LDAPGroupType

class MemberDNGroupTypeUnion(LDAPGroupType):

    def __init__(self, *types, name_attr='cn'):
        self.types = types
        super(MemberDNGroupTypeUnion, self).__init__(name_attr)

    def user_groups(self, ldap_user, group_search):
        res = dict()
        for t in self.types:
            res.update(t.user_groups(ldap_user, group_search))
        return res.items()

    def is_member(self, ldap_user, group_dn):
        for t in self.types:
            if t.is_member(ldap_user, group_dn):
                return True
        return False
