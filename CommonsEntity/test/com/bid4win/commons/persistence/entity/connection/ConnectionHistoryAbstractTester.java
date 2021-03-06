package com.bid4win.commons.persistence.entity.connection;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.junit.Test;

import com.bid4win.commons.core.UtilString;
import com.bid4win.commons.core.exception.Bid4WinException;
import com.bid4win.commons.core.exception.UserException;
import com.bid4win.commons.core.reference.MessageRef;
import com.bid4win.commons.core.security.IdGenerator;
import com.bid4win.commons.persistence.entity.EntityGenerator;
import com.bid4win.commons.persistence.entity.account.AccountAbstract;
import com.bid4win.commons.persistence.entity.account.AccountBasedEntityTester;

/**
 * Classe de test d'un historique de connexion d'un compte utilisateur<BR>
 * <BR>
 * @param <HISTORY> TODO A COMMENTER<BR>
 * @param <CONNECTION> TODO A COMMENTER<BR>
 * @param <ACCOUNT> TODO A COMMENTER<BR>
 * @param <GENERATOR> TODO A COMMENTER<BR>
 * <BR>
 * @author Emeric Fill�tre
 */
public abstract class ConnectionHistoryAbstractTester<HISTORY extends ConnectionHistoryAbstract<HISTORY, ACCOUNT>,
                                                      CONNECTION extends ConnectionAbstract<CONNECTION, HISTORY, ACCOUNT>,
                                                      ACCOUNT extends AccountAbstract<ACCOUNT>,
                                                      GENERATOR extends EntityGenerator<ACCOUNT>>
       extends AccountBasedEntityTester<HISTORY, ACCOUNT, GENERATOR>
{
  /**
   *
   * TODO A COMMENTER
   * @param account {@inheritDoc}
   * @return {@inheritDoc}
   * @throws UserException {@inheritDoc}
   * @see com.bid4win.commons.persistence.entity.account.AccountBasedEntityTester#createEntity(com.bid4win.commons.persistence.entity.account.AccountAbstract)
   */
  @Override
  protected HISTORY createEntity(ACCOUNT account) throws UserException
  {
    return this.createHistory(this.createConnection(account, true));
  }
  /**
   *
   * TODO A COMMENTER
   * @param account TODO A COMMENTER
   * @param stopped TODO A COMMENTER
   * @return TODO A COMMENTER
   * @throws UserException TODO A COMMENTER
   */
  protected CONNECTION createConnection(ACCOUNT account, boolean stopped) throws UserException
  {
    try
    {
      CONNECTION connection = this.createConnection(
          IdGenerator.generateId(UtilString.createRepeatedString('H', 32).toString()),
          account, this.getGenerator().createIpAddress(false), false);
      if(stopped)
      {
        return connection.endConnection(DisconnectionReason.MANUAL);
      }
      return connection;
    }
    catch(UserException ex)
    {
      throw ex;
    }
    catch(Bid4WinException ex)
    {
      throw new UserException(MessageRef.UNKNOWN_ERROR, ex);
    }
  }
  /**
   *
   * TODO A COMMENTER
   * @param sessionId TODO A COMMENTER
   * @param account TODO A COMMENTER
   * @param ipAddress TODO A COMMENTER
   * @param remanent TODO A COMMENTER
   * @return TODO A COMMENTER
   * @throws UserException TODO A COMMENTER
   */
  protected abstract CONNECTION createConnection(String sessionId, ACCOUNT account,
                                                 IpAddress ipAddress, boolean remanent)
            throws UserException;
  /**
   *
   * TODO A COMMENTER
   * @param connection TODO A COMMENTER
   * @return TODO A COMMENTER
   * @throws UserException TODO A COMMENTER
   */
  protected abstract HISTORY createHistory(CONNECTION connection) throws UserException;

  /**
   * Test of ConnectionHistoryAbstract(...) method, of class ConnectionHistoryAbstract.
   * @throws Bid4WinException {@inheritDoc}
   * @see com.bid4win.commons.persistence.entity.account.AccountBasedEntityTester#testConstructor_etc()
   */
  @Override
  @Test
  public void testConstructor_etc() throws Bid4WinException
  {
    super.testConstructor_etc();

    ACCOUNT account = this.getGenerator().createAccount("123");
    IpAddress ipAddress = this.getGenerator().createIpAddress(false);
    String sessionId = IdGenerator.generateId(32);
    DisconnectionReason reason = DisconnectionReason.REMANENCE;
    CONNECTION connection = this.createConnection(sessionId, account, ipAddress, true);
    try
    {
      this.createHistory(connection);
      fail("Should fail with not stopped connection");
    }
    catch(UserException ex)
    {
      System.out.println(ex.getMessage());
    }
    connection.endConnection(reason);
    try
    {
      HISTORY history = this.createHistory(connection);
      assertTrue("Bad account", account == history.getAccount());
      assertTrue("Bad sessionId", sessionId == history.getSessionId());
      assertTrue("Bad remanence", connection.isRemanent() == history.isRemanent());
      assertTrue("Bad IP address", ipAddress == history.getIpAddress());
      assertTrue("Bad start date", connection.getStartDate() == history.getStartDate());
      assertTrue("Bad disconnection reason", reason == history.getDisconnectionReason());
    }
    catch(UserException ex)
    {
      ex.printStackTrace();
      fail("Instanciation should not fail: " + ex.getMessage());
    }

    connection = this.createConnection(sessionId, account, ipAddress, false);
    try
    {
      this.createHistory(connection);
      fail("Should fail with not stopped connection");
    }
    catch(UserException ex)
    {
      System.out.println(ex.getMessage());
    }
    connection.endConnection(reason);
    try
    {
      HISTORY history = this.createHistory(connection);
      assertTrue("Bad account", account == history.getAccount());
      assertTrue("Bad sessionId", sessionId == history.getSessionId());
      assertTrue("Bad remanence", connection.isRemanent() == history.isRemanent());
      assertTrue("Bad IP address", ipAddress == history.getIpAddress());
      assertTrue("Bad start date", connection.getStartDate() == history.getStartDate());
      assertTrue("Bad disconnection reason", reason == history.getDisconnectionReason());
    }
    catch(UserException ex)
    {
      ex.printStackTrace();
      fail("Instanciation should not fail: " + ex.getMessage());
    }
  }
  /**
   * Test of sameInternal(ConnectionHistory, boolean), of class ConnectionHistory.
   * @throws Bid4WinException Issue not expected during this test
   */
 /* @Test
  public void testSameInternal_ConnectionHistory_boolean() throws Bid4WinException
  {
    Account account = this.getGenerator().createAccount(123);
    String sessionId = UtilString.createRepeatedString('1', 32).toString();
    ConnectionHistory connection1 = new ConnectionHistory(account,
                                                          this.getGenerator().createIpAddress(false),
                                                          sessionId);
    ConnectionHistory connection2 = new ConnectionHistory(account,
                                                          this.getGenerator().createIpAddress(false),
                                                          sessionId);
    assertTrue(connection1.same(connection2));
    assertTrue(connection2.same(connection1));
    assertTrue(connection1.identical(connection2));
    assertTrue(connection2.identical(connection1));

    connection1.defineEndDate();
    assertFalse(connection1.same(connection2));
    assertFalse(connection2.same(connection1));
    assertFalse(connection1.identical(connection2));
    assertFalse(connection2.identical(connection1));

    connection2.defineEndDate();
    assertTrue(connection1.same(connection2));
    assertTrue(connection2.same(connection1));
    assertTrue(connection1.identical(connection2));
    assertTrue(connection2.identical(connection1));
  }

  /**
   * Test of defineEndDate(), of class ConnectionHistory.
   * @throws Bid4WinException Issue not expected during this test
   */
 /* @Test
  public void testDefineEndDate_0args() throws Bid4WinException
  {
    String sessionId = UtilString.createRepeatedString('1', 32).toString();
    ConnectionHistory connection = new ConnectionHistory(this.getGenerator().createAccount(123),
                                                         this.getGenerator().createIpAddress(false),
                                                         sessionId);
    assertNull("Should be null", connection.getEndDate());
    Bid4WinDate before = new Bid4WinDate();
    try
    {
      connection.defineEndDate();
    }
    catch(ModelArgumentException ex)
    {
      ex.printStackTrace();
      fail("Should not fail");
    }
    Bid4WinDate after = new Bid4WinDate();
    assertNotNull("Should not be null", connection.getEndDate());
    assertFalse("Bad end date", before.after(connection.getEndDate()));
    assertFalse("Bad end date", after.before(connection.getEndDate()));
    try
    {
      connection.defineEndDate();
      fail("Should fail");
    }
    catch(ModelArgumentException ex)
    {
      System.out.println(ex.getMessage());
    }
  }*/
}
