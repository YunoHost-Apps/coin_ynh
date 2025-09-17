from django_auth_ldap.config import LDAPGroupType, MemberDNGroupType


class MemberDNGroupTypeWithoutPrimaryGroup(MemberDNGroupType):
    def __init__(self, member_attr, name_attr="cn"):
        super().__init__(member_attr, name_attr)

    def user_groups(self, ldap_user, group_search):
        result = super().user_groups(ldap_user, group_search)
        # We exclude the primary group of the user
        result = {k: v
                  for k, v in result
                  if k != f'cn={ldap_user._username},ou=groups,dc=yunohost,dc=org'}.items()
        return result


class MemberDNGroupTypeUnion(LDAPGroupType):
    def __init__(self, *types, name_attr='cn'):
        self.types = types
        super().__init__(name_attr)

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
