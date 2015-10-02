{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}
{-# LANGUAGE TypeOperators      #-}

{-# OPTIONS_GHC -fno-warn-unused-imports    #-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}

-- |
-- Module      : Network.Google.Resource.AdSense.Accounts.CustomChannels.Get
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- | Get the specified custom channel from the specified ad client for the
-- specified account.
--
-- /See:/ <https://developers.google.com/adsense/management/ AdSense Management API Reference> for @AdsenseAccountsCustomChannelsGet@.
module Network.Google.Resource.AdSense.Accounts.CustomChannels.Get
    (
    -- * REST Resource
      AccountsCustomChannelsGetResource

    -- * Creating a Request
    , accountsCustomChannelsGet'
    , AccountsCustomChannelsGet'

    -- * Request Lenses
    , accgQuotaUser
    , accgPrettyPrint
    , accgCustomChannelId
    , accgUserIP
    , accgAdClientId
    , accgAccountId
    , accgKey
    , accgOAuthToken
    , accgFields
    ) where

import           Network.Google.AdSense.Types
import           Network.Google.Prelude

-- | A resource alias for @AdsenseAccountsCustomChannelsGet@ which the
-- 'AccountsCustomChannelsGet'' request conforms to.
type AccountsCustomChannelsGetResource =
     "accounts" :>
       Capture "accountId" Text :>
         "adclients" :>
           Capture "adClientId" Text :>
             "customchannels" :>
               Capture "customChannelId" Text :>
                 QueryParam "quotaUser" Text :>
                   QueryParam "prettyPrint" Bool :>
                     QueryParam "userIp" Text :>
                       QueryParam "key" Key :>
                         QueryParam "oauth_token" OAuthToken :>
                           QueryParam "fields" Text :>
                             QueryParam "alt" AltJSON :>
                               Get '[JSON] CustomChannel

-- | Get the specified custom channel from the specified ad client for the
-- specified account.
--
-- /See:/ 'accountsCustomChannelsGet'' smart constructor.
data AccountsCustomChannelsGet' = AccountsCustomChannelsGet'
    { _accgQuotaUser       :: !(Maybe Text)
    , _accgPrettyPrint     :: !Bool
    , _accgCustomChannelId :: !Text
    , _accgUserIP          :: !(Maybe Text)
    , _accgAdClientId      :: !Text
    , _accgAccountId       :: !Text
    , _accgKey             :: !(Maybe Key)
    , _accgOAuthToken      :: !(Maybe OAuthToken)
    , _accgFields          :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'AccountsCustomChannelsGet'' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'accgQuotaUser'
--
-- * 'accgPrettyPrint'
--
-- * 'accgCustomChannelId'
--
-- * 'accgUserIP'
--
-- * 'accgAdClientId'
--
-- * 'accgAccountId'
--
-- * 'accgKey'
--
-- * 'accgOAuthToken'
--
-- * 'accgFields'
accountsCustomChannelsGet'
    :: Text -- ^ 'customChannelId'
    -> Text -- ^ 'adClientId'
    -> Text -- ^ 'accountId'
    -> AccountsCustomChannelsGet'
accountsCustomChannelsGet' pAccgCustomChannelId_ pAccgAdClientId_ pAccgAccountId_ =
    AccountsCustomChannelsGet'
    { _accgQuotaUser = Nothing
    , _accgPrettyPrint = True
    , _accgCustomChannelId = pAccgCustomChannelId_
    , _accgUserIP = Nothing
    , _accgAdClientId = pAccgAdClientId_
    , _accgAccountId = pAccgAccountId_
    , _accgKey = Nothing
    , _accgOAuthToken = Nothing
    , _accgFields = Nothing
    }

-- | Available to use for quota purposes for server-side applications. Can be
-- any arbitrary string assigned to a user, but should not exceed 40
-- characters. Overrides userIp if both are provided.
accgQuotaUser :: Lens' AccountsCustomChannelsGet' (Maybe Text)
accgQuotaUser
  = lens _accgQuotaUser
      (\ s a -> s{_accgQuotaUser = a})

-- | Returns response with indentations and line breaks.
accgPrettyPrint :: Lens' AccountsCustomChannelsGet' Bool
accgPrettyPrint
  = lens _accgPrettyPrint
      (\ s a -> s{_accgPrettyPrint = a})

-- | Custom channel to retrieve.
accgCustomChannelId :: Lens' AccountsCustomChannelsGet' Text
accgCustomChannelId
  = lens _accgCustomChannelId
      (\ s a -> s{_accgCustomChannelId = a})

-- | IP address of the site where the request originates. Use this if you
-- want to enforce per-user limits.
accgUserIP :: Lens' AccountsCustomChannelsGet' (Maybe Text)
accgUserIP
  = lens _accgUserIP (\ s a -> s{_accgUserIP = a})

-- | Ad client which contains the custom channel.
accgAdClientId :: Lens' AccountsCustomChannelsGet' Text
accgAdClientId
  = lens _accgAdClientId
      (\ s a -> s{_accgAdClientId = a})

-- | Account to which the ad client belongs.
accgAccountId :: Lens' AccountsCustomChannelsGet' Text
accgAccountId
  = lens _accgAccountId
      (\ s a -> s{_accgAccountId = a})

-- | API key. Your API key identifies your project and provides you with API
-- access, quota, and reports. Required unless you provide an OAuth 2.0
-- token.
accgKey :: Lens' AccountsCustomChannelsGet' (Maybe Key)
accgKey = lens _accgKey (\ s a -> s{_accgKey = a})

-- | OAuth 2.0 token for the current user.
accgOAuthToken :: Lens' AccountsCustomChannelsGet' (Maybe OAuthToken)
accgOAuthToken
  = lens _accgOAuthToken
      (\ s a -> s{_accgOAuthToken = a})

-- | Selector specifying which fields to include in a partial response.
accgFields :: Lens' AccountsCustomChannelsGet' (Maybe Text)
accgFields
  = lens _accgFields (\ s a -> s{_accgFields = a})

instance GoogleAuth AccountsCustomChannelsGet' where
        authKey = accgKey . _Just
        authToken = accgOAuthToken . _Just

instance GoogleRequest AccountsCustomChannelsGet'
         where
        type Rs AccountsCustomChannelsGet' = CustomChannel
        request = requestWithRoute defReq adSenseURL
        requestWithRoute r u AccountsCustomChannelsGet'{..}
          = go _accgQuotaUser (Just _accgPrettyPrint)
              _accgCustomChannelId
              _accgUserIP
              _accgAdClientId
              _accgAccountId
              _accgKey
              _accgOAuthToken
              _accgFields
              (Just AltJSON)
          where go
                  = clientWithRoute
                      (Proxy :: Proxy AccountsCustomChannelsGetResource)
                      r
                      u